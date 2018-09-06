package model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "attendee")
public class Attendee {
    private int id;
    private String email;
    private String code;
    private boolean deleted;
    private Seminar seminarBySeminarId;
    private String nameTag;

    @Basic
    @Column(name = "deleted", nullable = false)
    public boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

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
    @Column(name = "deleted", nullable = false)
    public boolean isDeleted() {
        return deleted;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Attendee attendee = (Attendee) o;
        return id == attendee.id &&
                deleted == attendee.deleted &&
                Objects.equals(email, attendee.email) &&
                Objects.equals(code, attendee.code);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, email, code, deleted);
    }

    @ManyToOne
    @JoinColumn(name = "seminar_id", referencedColumnName = "id", nullable = false)
    public Seminar getSeminarBySeminarId() {
        return seminarBySeminarId;
    }

    public void setSeminarBySeminarId(Seminar seminarBySeminarId) {
        this.seminarBySeminarId = seminarBySeminarId;
    }

    @Basic
    @Column(name = "name_tag", nullable = true, length = 20)
    public String getNameTag() {
        return nameTag;
    }

    public void setNameTag(String nameTag) {
        this.nameTag = nameTag;
    }
}
