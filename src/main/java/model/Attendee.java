package model;

import javax.persistence.*;
import java.util.Objects;

@Entity
public class Attendee {
    private int id;
    private String email;
    private String code;
    private int adminId;
    private byte deleted;
    private Admin adminByAdminId;
    private Seminar seminarBySeminarId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "code", nullable = false, length = 200)
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    @Column(name = "admin_id", nullable = false)
    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    @Basic
    @Column(name = "deleted", nullable = false)
    public byte getDeleted() {
        return deleted;
    }

    public void setDeleted(byte deleted) {
        this.deleted = deleted;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Attendee attendee = (Attendee) o;
        return id == attendee.id &&
                adminId == attendee.adminId &&
                deleted == attendee.deleted &&
                Objects.equals(email, attendee.email) &&
                Objects.equals(code, attendee.code);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, email, code, adminId, deleted);
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
    @JoinColumn(name = "seminar_id", referencedColumnName = "id", nullable = false)
    public Seminar getSeminarBySeminarId() {
        return seminarBySeminarId;
    }

    public void setSeminarBySeminarId(Seminar seminarBySeminarId) {
        this.seminarBySeminarId = seminarBySeminarId;
    }
}
