package service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import repository.AttendeeRepository;

@Transactional
@Service
public class AttendeeService {

    @Autowired
    AttendeeRepository attendeeRepository;


}
