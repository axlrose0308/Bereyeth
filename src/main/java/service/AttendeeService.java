package service;


import exception.RegisteredException;
import model.Attendee;
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
        return attendeeRepository.getOne(id);
    }

    public void delete(Integer attendeeId){
        Attendee attendee = get(attendeeId);
        attendee.setDeleted(true);
        attendeeRepository.saveAndFlush(attendee);
    }


}
