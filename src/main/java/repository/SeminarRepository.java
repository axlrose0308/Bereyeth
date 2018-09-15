package repository;

import model.Host;
import model.Organizer;
import model.Seminar;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Time;
import java.sql.Date;
import java.util.List;

public interface SeminarRepository extends JpaRepository<Seminar, Integer> {

    Seminar findById(Integer id);
    Seminar findByLocation(String location);
    Seminar findByTime(Time time);
    Seminar findBySubject(String subject);
    Seminar findByDescription(String description);
    Seminar findByDuration(Time time);
    Seminar findByCapacity(Integer capacity);
    List<Seminar> findAllByDeletedFalse();
    List<Seminar> findAllByOrganizerByOrganizerIdAndDeletedFalse(Organizer organizer);
    List<Seminar> findAllByHostByHostIdAndDeletedFalse(Host host);
    List<Seminar> findAllByAdminByAdminId(Integer id);

    @Query(value="select * from seminar s where s.host_id = :hostId AND s.hold_date LIKE :holdDate%", nativeQuery = true)
    Seminar findByHoldDateAndHostId(@Param(value = "holdDate") String holdDate, @Param(value = "hostId") Integer hostId);

    @Modifying
    @Query("update Seminar s set s.deleted = true where s.id = :id")
    Integer updateDeletedById (@Param(value = "id") Integer id);

    List<Seminar> findAllByDeletedFalseAndHoldDateAfter(Date holdDate);

    List<Seminar> findAllByCategoryAndDeletedFalseAndHoldDateAfter(String category, Date holdDate);
}
