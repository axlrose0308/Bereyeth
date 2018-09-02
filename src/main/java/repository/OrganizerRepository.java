package repository;

import model.Organizer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrganizerRepository extends JpaRepository<Organizer, Integer> {

    Organizer findByUsernameAndPassword(String username, String password);
}
