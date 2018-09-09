package service;

import model.Host;
import model.Organizer;
import model.Seminar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import repository.HostRepository;
import repository.SeminarRepository;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Transactional
@Service
public class SeminarService {

    @Autowired
    SeminarRepository seminarRepository;

    @Autowired
    HostRepository hostRepository;

    public List<Seminar> getAll() {
        return seminarRepository.findAll();
    }
    public List<Seminar> getAllByOrganiserId(Organizer organizer){ return seminarRepository.findAllByOrganizerByOrganizerId(organizer);}

    public List<Host> getAvailableHosts(){
        List<Host> allHosts = hostRepository.findAllByDeletedFalse();
        List<Host> hosts = new ArrayList<Host>();
        for(Host host: allHosts){
            Seminar seminar = seminarRepository.findLastByHostByHostIdOrderByHoldDate(host);
            if(seminar == null ||
                    seminar.getHoldDate().before( new java.sql.Date(new Date().getTime() ))
            ) hosts.add(host);
        }
        return hosts;
    }

    public Integer addSeminar(Seminar seminar){
        return seminarRepository.save(seminar).getId();
    }
}
