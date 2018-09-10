package service;

import exception.HostUnavailableException;
import model.Host;
import model.Organizer;
import model.Seminar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import repository.HostRepository;
import repository.SeminarRepository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
    public List<Seminar> getAllByOrganiserId(Organizer organizer){ return seminarRepository.findAllByOrganizerByOrganizerIdAndDeletedFalse(organizer);}


    public Seminar get(Integer id){ return seminarRepository.findById(id); }

    public Integer addSeminar(Seminar seminar) throws HostUnavailableException {
        Seminar anotherSeminar = seminarRepository.findByHoldDateAndHostId(seminar.getHoldDate().toString(),seminar.getHostByHostId().getId());
        if( anotherSeminar!= null){
            throw new HostUnavailableException(seminar.getHostByHostId().getUsername(), seminar.getHoldDate().toString());
        }

        return seminarRepository.save(seminar).getId();
    }

    public void deleteSeminar(Integer id){
        seminarRepository.updateDeletedById(id);
    }

    public void updateSeminar(Integer seminarId, String location, String time, String subject, String description,
                              String duration, int capacity, String holdDate, Integer hostId) throws HostUnavailableException {
        Host host = hostRepository.findById(hostId);
        Seminar seminar = get(seminarId);
        seminar.setLocation(location);
        seminar.setTimeString(time);
        seminar.setSubject(subject);
        seminar.setDescription(description);
        seminar.setDurationString(duration);
        seminar.setCapacity(capacity);


        Seminar anotherSeminar = seminarRepository.findByHoldDateAndHostId(holdDate, hostId);
        if( anotherSeminar!= null && anotherSeminar.getId() != seminarId){
            throw new HostUnavailableException(host.getUsername(), holdDate);
        }

        seminar.setHoldDateString(holdDate);
        seminar.setHostByHostId(hostRepository.findById(hostId));
        seminarRepository.saveAndFlush(seminar);
    }
}
