package model;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "organizer")
public class Organizer {
    private int id;
    private String username;
    private String password;
    private String email;
    private boolean deleted;
    private Admin adminByAdminId;
    private Collection<Seminar> seminarsById;
    private String phone;

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
    @Column(name = "email", nullable = false, length = 30)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "deleted", nullable = false)
    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Organizer organizer = (Organizer) o;
        return id == organizer.id &&
                deleted == organizer.deleted &&
                Objects.equals(username, organizer.username) &&
                Objects.equals(password, organizer.password) &&
                Objects.equals(email, organizer.email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, username, password, email, deleted);
    }

    @ManyToOne
    @JoinColumn(name = "admin_id", referencedColumnName = "id", nullable = false)
    public Admin getAdminByAdminId() {
        return adminByAdminId;
    }

    public void setAdminByAdminId(Admin adminByAdminId) {
        this.adminByAdminId = adminByAdminId;
    }

    @OneToMany(mappedBy = "organizerByOrganizerId")
    public Collection<Seminar> getSeminarsById() {
        return seminarsById;
    }

    public void setSeminarsById(Collection<Seminar> seminarsById) {
        this.seminarsById = seminarsById;
    }

    @Basic
    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
