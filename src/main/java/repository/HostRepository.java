package repository;

import model.Host;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HostRepository extends JpaRepository<Host, Integer> {

    Host findByUsernameAndPassword(String username, String password);
}
