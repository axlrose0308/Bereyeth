package model;

import org.jasypt.util.text.BasicTextEncryptor;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "attendee")
public class Attendee {
    private int id;
    private String email;
    private String code;
    private boolean deleted;
    private String nameTag;
    private Seminar seminarBySeminarId;


    public Attendee(){}
    public Attendee(String email, String nameTag, Seminar seminar){
        this.email = email;
        this.nameTag = nameTag;
        deleted = false;
        seminarBySeminarId = seminar;
        generateCode();
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

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    @Basic
    @Column(name = "name_tag", nullable = true, length = 20)
    public String getNameTag() {
        return nameTag;
    }

    public void setNameTag(String nameTag) {
        this.nameTag = nameTag;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Attendee attendee = (Attendee) o;
        return id == attendee.id &&
                deleted == attendee.deleted &&
                Objects.equals(email, attendee.email) &&
                Objects.equals(code, attendee.code) &&
                Objects.equals(nameTag, attendee.nameTag);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, email, code, deleted, nameTag);
    }

    @ManyToOne
    @JoinColumn(name = "seminar_id", referencedColumnName = "id", nullable = false)
    public Seminar getSeminarBySeminarId() {
        return seminarBySeminarId;
    }

    public void setSeminarBySeminarId(Seminar seminarBySeminarId) {
        this.seminarBySeminarId = seminarBySeminarId;
    }

    private void generateCode(){
        String key = getEmail()+getSeminarBySeminarId().getHoldDate()+getSeminarBySeminarId().getId();
        int hash, i;
        for (hash = 0, i = 0; i < key.length(); ++i) {
            hash += key.charAt(i);
            hash += (hash << 10);
            hash ^= (hash >> 6);
        }
        hash += (hash << 3);
        hash ^= (hash >> 11);
        hash += (hash << 15);
        code = "SEMA"+ Math.abs(hash) + "";
    }
}
