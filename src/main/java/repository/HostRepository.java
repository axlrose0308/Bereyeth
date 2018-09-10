package repository;

import model.Host;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HostRepository extends JpaRepository<Host, Integer> {

    Host findByUsernameAndDeletedFalse(String username);
    Host findById(Integer id);
    Host findByUsernameAndPasswordAndDeletedFalse(String username, String password);
    List<Host> findAllByOrderById();
    List<Host> findAllByDeletedFalse();

}
