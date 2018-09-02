package service;

import model.Host;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import repository.HostRepository;

@Transactional
@Service
public class HostService {

    @Autowired
    HostRepository hostRepository;

    public Host login(String username, String password) {
        return hostRepository.findByUsernameAndPassword(username, password);
    }

    public void addHost(Host host) {
        hostRepository.save(host);
    }
}
