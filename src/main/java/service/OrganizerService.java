package service;

import exception.LoginFailException;
import exception.ModifyException;
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
        if (organizer == null) throw new LoginFailException();
        return organizer;
    }

    public List<Organizer> getAll() {
        return organizerRepository.findAllByDeletedFalse();
    }

    public void add(HttpSession session,
                    String username,
                    String password,
                    String email) throws ModifyException {
        Admin admin = (Admin) session.getAttribute("admin");
        Organizer organizer = new Organizer();
        organizer.setUsername(username);
        if (organizerRepository.findByUsernameAndDeletedFalse(username) != null) throw new ModifyException("" +
                "Organizer with user name " + username + " already exists.");
        organizer.setPassword(password);
        organizer.setEmail(email);
        organizer.setAdminByAdminId(admin);
        organizerRepository.save(organizer);
    }

    public void modify(Integer id,
                       String password,
                       String email, Admin admin, String phone) {
        Organizer organizer = get(id);
        organizer.setPassword(password);
        organizer.setEmail(email);
        organizer.setAdminByAdminId(admin);
        organizer.setPhone(phone);
        organizerRepository.saveAndFlush(organizer);
    }

    public void delete(Integer id) {
        Organizer organizer = organizerRepository.findById(id);
        organizer.setDeleted(true);
        organizerRepository.saveAndFlush(organizer);
    }

    public Organizer get(Integer id) {
        return organizerRepository.findOne(id);
    }
}
