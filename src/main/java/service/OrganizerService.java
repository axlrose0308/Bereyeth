package service;

import exception.LoginFailException;
import model.Admin;
import model.Organizer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import repository.OrganizerRepository;

import javax.servlet.http.HttpSession;
import java.util.List;

@Transactional
@Service
public class OrganizerService {

    @Autowired
    OrganizerRepository organizerRepository;

    public Organizer login(String username,
                           String password) throws LoginFailException {
        Organizer organizer = organizerRepository.findByUsernameAndPasswordAndDeletedFalse(username, password);
        if(organizer == null) throw new LoginFailException();
        return organizer;
    }

    public List<Organizer> getAll(){
        return organizerRepository.findAllByOrderById();
    }

    public void add(HttpSession session,
                    String username,
                    String password,
                    String email) {
        Admin admin = (Admin) session.getAttribute("admin");
        Organizer organizer = new Organizer();
        organizer.setUsername(username);
        organizer.setPassword(password);
        organizer.setEmail(email);
        organizer.setAdminByAdminId(admin);
        organizerRepository.save(organizer);
    }

    public void modify(HttpSession session,
                       Integer id,
                       String username,
                       String password,
                       String email) {
        Admin admin = (Admin) session.getAttribute("admin");
        Organizer organizer = new Organizer();
        organizer.setId(id);
        organizer.setUsername(username);
        organizer.setPassword(password);
        organizer.setEmail(email);
        organizer.setAdminByAdminId(admin);
        organizerRepository.saveAndFlush(organizer);
    }

    public void delete(Integer id) {
        Organizer organizer = organizerRepository.findById(id);
        organizer.setDeleted(true);
        organizerRepository.saveAndFlush(organizer);
    }
}
