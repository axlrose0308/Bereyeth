package repository;

import model.Organizer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrganizerRepository extends JpaRepository<Organizer, Integer> {

    Organizer findByUsernameAndPassword(String username, String password);
    List<Organizer> findAllByOrderById();
}
