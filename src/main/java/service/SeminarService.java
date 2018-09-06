package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import repository.SeminarRepository;

@Transactional
@Service
public class SeminarService {

    @Autowired
    SeminarRepository seminarRepository;


}
