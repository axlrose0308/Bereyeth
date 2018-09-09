package model;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "host")
public class Host {
    private int id;
    private String username;
    private String password;
    private String phone;
    private String email;
    private boolean deleted;
    private Admin adminByAdminId;
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
    @Column(name = "phone", nullable = true, length = 30)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "email", nullable = false, length = 50)
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
        Host host = (Host) o;
        return id == host.id &&
                deleted == host.deleted &&
                Objects.equals(username, host.username) &&
                Objects.equals(password, host.password) &&
                Objects.equals(phone, host.phone) &&
                Objects.equals(email, host.email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, username, password, phone, email, deleted);
    }

    @ManyToOne
    @JoinColumn(name = "admin_id", referencedColumnName = "id", nullable = false)
    public Admin getAdminByAdminId() {
        return adminByAdminId;
    }

    public void setAdminByAdminId(Admin adminByAdminId) {
        this.adminByAdminId = adminByAdminId;
    }

    @OneToMany(mappedBy = "hostByHostId")
    public Collection<Seminar> getSeminarsById() {
        return seminarsById;
    }

    public void setSeminarsById(Collection<Seminar> seminarsById) {
        this.seminarsById = seminarsById;
    }
}
