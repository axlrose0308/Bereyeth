package service;

import exception.LoginFailException;
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

    public Admin login(String username,
                       String password) throws LoginFailException {
        Admin admin = adminRepository.findByUsernameAndPassword(username, password);
        if(admin == null) throw new LoginFailException();
        return admin;
    }
}
