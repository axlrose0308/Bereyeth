package service;

import model.Admin;
import model.Host;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import repository.HostRepository;

import javax.servlet.http.HttpSession;
import java.util.List;

@Transactional
@Service
public class HostService {

    @Autowired
    HostRepository hostRepository;

    public Host login(String username,
                      String password) {
        return hostRepository.findByUsernameAndPassword(username, password);
    }

    public void addHost(HttpSession session,
                        String username,
                        String password,
                        String phone,
                        String email) {
        Host host = new Host();
        host.setEmail(email);
        host.setPhone(phone);
        host.setUsername(username);
        host.setPassword(password);
        host.setAdminByAdminId((Admin) session.getAttribute("admin"));
        hostRepository.save(host);
    }

    public List<Host> getAll() {
        return hostRepository.findAllByOrderById();
    }

    public void modify(HttpSession session,
                       Integer id,
                       String username,
                       String password,
                       String phone,
                       String email) {
        Host host = new Host();
        host.setId(id);
        host.setUsername(username);
        host.setPassword(password);
        host.setPhone(phone);
        host.setEmail(email);
        host.setAdminByAdminId((Admin) session.getAttribute("admin"));
        hostRepository.saveAndFlush(host);
    }

    public void delete(Integer id) {
        Host host = hostRepository.findById(id);
        host.setDeleted(true);
        hostRepository.saveAndFlush(host);
    }
}
