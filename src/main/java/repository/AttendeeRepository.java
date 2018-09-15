package repository;

import model.Attendee;
import model.Seminar;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface AttendeeRepository extends JpaRepository<Attendee, Integer> {

    List<Attendee> findAllBySeminarBySeminarIdAndDeletedFalse(Seminar seminar);
    Attendee findByEmailAndDeletedFalseAndSeminarBySeminarId(String email, Seminar seminar);
    Attendee findByCode(String code);
    @Modifying
    @Query("update Attendee a set a.deleted = true where a.seminarBySeminarId = :seminar")
    Integer updateDeletedBySeminar (@Param(value = "seminar") Seminar seminar);
}
