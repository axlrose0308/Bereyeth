package model;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "admin", schema = "seminar_management_system")
public class Admin {
    private int id;
    private String username;
    private String password;
    private String email;
    private Collection<Attendee> attendeesById;
    private Collection<Host> hostsById;
    private Collection<Organizer> organizersById;
    private Collection<Seminar> seminarsById;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "username", nullable = false, length = 20)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "password", nullable = false, length = 100)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "email", nullable = false, length = 50)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Admin admin = (Admin) o;
        return id == admin.id &&
                Objects.equals(username, admin.username) &&
                Objects.equals(password, admin.password) &&
                Objects.equals(email, admin.email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, username, password, email);
    }

    @OneToMany(mappedBy = "adminByAdminId")
    public Collection<Attendee> getAttendeesById() {
        return attendeesById;
    }

    public void setAttendeesById(Collection<Attendee> attendeesById) {
        this.attendeesById = attendeesById;
    }

    @OneToMany(mappedBy = "adminByAdminId")
    public Collection<Host> getHostsById() {
        return hostsById;
    }

    public void setHostsById(Collection<Host> hostsById) {
        this.hostsById = hostsById;
    }

    @OneToMany(mappedBy = "adminByAdminId")
    public Collection<Organizer> getOrganizersById() {
        return organizersById;
    }

    public void setOrganizersById(Collection<Organizer> organizersById) {
        this.organizersById = organizersById;
    }

    @OneToMany(mappedBy = "adminByAdminId")
    public Collection<Seminar> getSeminarsById() {
        return seminarsById;
    }

    public void setSeminarsById(Collection<Seminar> seminarsById) {
        this.seminarsById = seminarsById;
    }
}
