package service;

import model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import repository.AdminRepository;

@Transactional
@Service
public class AdminService {

    @Autowired
    AdminRepository adminRepository;

    public Admin login(String username, String password) {
        return adminRepository.findByUsernameAndPassword(username, password);
    }
}
