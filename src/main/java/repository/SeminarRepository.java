package repository;

import model.Seminar;
import org.springframework.data.jpa.repository.JpaRepository;

import java.sql.Time;
import java.util.List;

public interface SeminarRepository extends JpaRepository<Seminar, Integer> {

    Seminar findById(Integer id);
    Seminar findByLocation(String location);
    Seminar findByTime(Time time);
    Seminar findBySubject(String subject);
    Seminar findByDescription(String description);
    Seminar findByDuration(Time time);
    Seminar findByCapacity(Integer capacity);
    List<Seminar> findAllByOrganizerByOrganizerId(Integer id);
    List<Seminar> findAllByHostByHostId(Integer id);
    List<Seminar> findAllByAdminByAdminId(Integer id);
}
