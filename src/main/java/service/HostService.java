package service;

import exception.LoginFailException;
import exception.ModifyException;
import model.Admin;
import model.Host;
import model.Seminar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.dom.ls.LSInput;
import repository.HostRepository;
import repository.SeminarRepository;
import sun.rmi.runtime.Log;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Transactional
@Service
public class HostService {

    @Autowired
    HostRepository hostRepository;

    @Autowired
    SeminarRepository seminarRepository;

    public Host login(String username,
                      String password) throws LoginFailException {
        Host host = hostRepository.findByUsernameAndPasswordAndDeletedFalse(username, password);
        if (host == null) throw new LoginFailException();
        return host;
    }

    public void addHost(HttpSession session,
                        String username,
                        String password,
                        String phone,
                        String email) throws ModifyException {

        Host host = new Host();
        if (hostRepository.findByUsernameAndDeletedFalse(username) == null) {
            host.setEmail(email);
            host.setPhone(phone);
            host.setUsername(username);
            host.setPassword(password);
            host.setAdminByAdminId((Admin) session.getAttribute("admin"));
            hostRepository.save(host);
        }
        else throw new ModifyException("Host of username "+username+" already exists.");
    }

    public List<Host> getAll() {
        return hostRepository.findAllByDeletedFalse();
    }

    public void modify(Integer id,
                       String password,
                       String phone,
                       String email) {
        Host host = get(id);
        host.setPassword(password);
        host.setPhone(phone);
        host.setEmail(email);
        hostRepository.saveAndFlush(host);
    }

    public void delete(Integer id) {
        Host host = hostRepository.findById(id);
        host.setDeleted(true);
        hostRepository.saveAndFlush(host);
    }

    public Host get(Integer id) {
        return hostRepository.findById(id);
    }

    public List<Seminar> getRelateSeminars(Host host) {
        return seminarRepository.findAllByHostByHostIdAndDeletedFalse(host);
    }
}
