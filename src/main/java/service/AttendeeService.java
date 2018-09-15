package service;


import exception.RegisteredException;
import model.Attendee;
import model.Seminar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import repository.AttendeeRepository;

@Transactional
@Service
public class AttendeeService {

    @Autowired
    AttendeeRepository attendeeRepository;

    public String add(Attendee attendee) throws RegisteredException {
        if(attendeeRepository.findByEmailAndDeletedFalseAndSeminarBySeminarId(attendee.getEmail(),
                attendee.getSeminarBySeminarId()) != null) throw new RegisteredException(attendee.getEmail());
        attendeeRepository.save(attendee);
        return attendee.getCode();
    }

    public Attendee get(Integer id){
        return attendeeRepository.findOne(id);
    }

    public void delete(Integer attendeeId){
        Attendee attendee = get(attendeeId);
        delete(attendee);
    }

    public void delete(Attendee attendee){
        attendee.setDeleted(true);
        attendeeRepository.saveAndFlush(attendee);
    }

    public Seminar delete(String code){
        Attendee attendee = attendeeRepository.findByCode(code);
        Seminar seminar = attendee.getSeminarBySeminarId();
        delete(attendee);
        return seminar;
    }

    public void modify(Integer id, String nameTag){
        Attendee attendee = get(id);
        attendee.setNameTag(nameTag);
        attendeeRepository.saveAndFlush(attendee);
    }


}
