package repository;

import model.Host;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HostRepository extends JpaRepository<Host, Integer> {

    Host findByUsername(String username);
    Host findById(Integer id);
    Host findByUsernameAndPassword(String username, String password);
    List<Host> findAllByOrderById();
}
