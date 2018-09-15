package service;

import exception.HostUnavailableException;
import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import repository.AttendeeRepository;
import repository.HostRepository;
import repository.SeminarRepository;

import java.sql.Date;
import java.util.List;

import static model.Email.*;

@Transactional
@Service
public class SeminarService {

    @Autowired
    SeminarRepository seminarRepository;

    @Autowired
    HostRepository hostRepository;

    @Autowired
    AttendeeRepository attendeeRepository;

    @Autowired
    EmailService emailService;

    public List<Seminar> getAll() {
        return seminarRepository.findAll();
    }
    public List<Seminar> getAllByOrganiserId(Organizer organizer){ return seminarRepository.findAllByOrganizerByOrganizerIdAndDeletedFalse(organizer);}

    public List<Seminar> getAvailables(){
        return seminarRepository.findAllByDeletedFalseAndHoldDateAfter(new Date(new java.util.Date().getTime()));
    }

    public Seminar get(Integer id){ return seminarRepository.findById(id); }

    public Integer addSeminar(Seminar seminar) throws HostUnavailableException {
        Seminar anotherSeminar = seminarRepository.findByHoldDateAndHostId(seminar.getHoldDate().toString(),seminar.getHostByHostId().getId());
        if( anotherSeminar!= null){
            throw new HostUnavailableException(seminar.getHostByHostId().getUsername(), seminar.getHoldDate().toString());
        }

        return seminarRepository.save(seminar).getId();
    }

    public void deleteSeminar(Integer id){
        if(getAttendeeEmails(id) != null){
            new Thread(new Runnable() {
                public void run() {
                    try {
                        emailService.sendEmail(getAttendeeEmails(id), SEMINAR_CANCELLED, get(id));
                    } catch (Exception ex) {
                    }
                }
            }).start();
            attendeeRepository.updateDeletedBySeminar(get(id));
        }

        seminarRepository.updateDeletedById(id);
    }

    public void updateSeminar(Integer seminarId, String location, String time, String subject, String description,
                              String duration, int capacity, String holdDate, Integer hostId, String category) throws HostUnavailableException {
        Host host = hostRepository.findById(hostId);
        Seminar seminar = get(seminarId);
        seminar.setLocation(location);
        seminar.setTimeString(time);
        seminar.setSubject(subject);
        seminar.setDescription(description);
        seminar.setDurationString(duration);
        seminar.setCapacity(capacity);
        seminar.setCategory(category);


        Seminar anotherSeminar = seminarRepository.findByHoldDateAndHostId(holdDate, hostId);
        if( anotherSeminar!= null && anotherSeminar.getId() != seminarId){
            throw new HostUnavailableException(host.getUsername(), holdDate);
        }

        seminar.setHoldDateString(holdDate);
        seminar.setHostByHostId(hostRepository.findById(hostId));
        seminarRepository.saveAndFlush(seminar);

        if(getAttendeeEmails(seminarId) != null){
            new Thread(new Runnable() {
                public void run() {
                    try {
                        emailService.sendEmail(getAttendeeEmails(seminarId), SEMINAR_CHANGED, seminar);
                    } catch (Exception ex) {
                    }
                }
            }).start();
        }


    }

    public List<Attendee> getAttendees(Integer id){
        return attendeeRepository.findAllBySeminarBySeminarIdAndDeletedFalse(get(id));
    }

    public String[] getAttendeeEmails(Integer id){
        List<Attendee> attendees = getAttendees(id);
        if(attendees == null || attendees.size() == 0) return null;
        String[] emails = new String[attendees.size()];
        for(int i = 0; i < attendees.size(); i++){
            emails[i] = attendees.get(i).getEmail();
        }
        return emails;
    }

    public List<Seminar> getAvailablesByCategory(String category){
        return seminarRepository.findAllByCategoryAndDeletedFalseAndHoldDateAfter(category, new Date(new java.util.Date().getTime()));
    }
}
