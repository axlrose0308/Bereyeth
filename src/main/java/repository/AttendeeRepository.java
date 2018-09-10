package repository;

import model.Attendee;
import model.Seminar;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AttendeeRepository extends JpaRepository<Attendee, Integer> {

    List<Attendee> findAllBySeminarBySeminarIdAndDeletedFalse(Seminar seminar);
    Attendee findByEmailAndDeletedFalseAndSeminarBySeminarId(String email, Seminar seminar);
    Attendee findByCode(String code);
}
