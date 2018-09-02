package service;

import model.Organizer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import repository.OrganizerRepository;

@Transactional
@Service
public class OrganizerService {

    @Autowired
    OrganizerRepository organizerRepository;

    public Organizer login(String username, String password) {
        return organizerRepository.findByUsernameAndPassword(username, password);
    }

    public void addOrganizer(Organizer organizer) {
        organizerRepository.save(organizer);
    }
}
