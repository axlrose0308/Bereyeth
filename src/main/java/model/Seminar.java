package model;

import javax.persistence.*;
import java.sql.Time;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "seminar", schema = "seminar_management_system")
public class Seminar {
    private int id;
    private String location;
    private Time time;
    private String subject;
    private String description;
    private Time duration;
    private Collection<Attendee> attendeesById;
    private Admin adminByAdminId;
    private Organizer organizerByOrganizerId;
    private Host hostByHostId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "location", nullable = true, length = 50)
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Basic
    @Column(name = "time", nullable = false)
    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    @Basic
    @Column(name = "subject", nullable = false, length = 20)
    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    @Basic
    @Column(name = "description", nullable = true, length = 200)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "duration", nullable = false)
    public Time getDuration() {
        return duration;
    }

    public void setDuration(Time duration) {
        this.duration = duration;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Seminar seminar = (Seminar) o;
        return id == seminar.id &&
                Objects.equals(location, seminar.location) &&
                Objects.equals(time, seminar.time) &&
                Objects.equals(subject, seminar.subject) &&
                Objects.equals(description, seminar.description) &&
                Objects.equals(duration, seminar.duration);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, location, time, subject, description, duration);
    }

    @OneToMany(mappedBy = "seminarBySeminarId")
    public Collection<Attendee> getAttendeesById() {
        return attendeesById;
    }

    public void setAttendeesById(Collection<Attendee> attendeesById) {
        this.attendeesById = attendeesById;
    }

    @ManyToOne
    @JoinColumn(name = "admin_id", referencedColumnName = "id", nullable = false)
    public Admin getAdminByAdminId() {
        return adminByAdminId;
    }

    public void setAdminByAdminId(Admin adminByAdminId) {
        this.adminByAdminId = adminByAdminId;
    }

    @ManyToOne
    @JoinColumn(name = "organizer_id", referencedColumnName = "id", nullable = false)
    public Organizer getOrganizerByOrganizerId() {
        return organizerByOrganizerId;
    }

    public void setOrganizerByOrganizerId(Organizer organizerByOrganizerId) {
        this.organizerByOrganizerId = organizerByOrganizerId;
    }

    @ManyToOne
    @JoinColumn(name = "host_id", referencedColumnName = "id", nullable = false)
    public Host getHostByHostId() {
        return hostByHostId;
    }

    public void setHostByHostId(Host hostByHostId) {
        this.hostByHostId = hostByHostId;
    }
}
