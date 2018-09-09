package service;

import model.Seminar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import repository.SeminarRepository;

import java.util.List;

@Transactional
@Service
public class SeminarService {

    @Autowired
    SeminarRepository seminarRepository;

    public List<Seminar> getAll() {
        return seminarRepository.findAll();
    }

}
