package murach.business;  // Hoặc murach.entity nếu bạn tạo package mới

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "users")  // Tên table trong DB, bạn có thể thay đổi
public class User implements Serializable {
    @Id  // Email làm primary key vì unique (nếu muốn auto-gen ID, dùng @GeneratedValue)
    private String email;
    private String firstName;
    private String lastName;
    private String dateOfBirth;
    private String hearAboutUs;
    private boolean wantAnnouncements;
    private boolean wantEmails;
    private String contactMethod;

    // Constructor mặc định (bắt buộc cho JPA)
    public User() {
        this.firstName = "";
        this.lastName = "";
        this.email = "";
        this.dateOfBirth = "";
        this.hearAboutUs = "";
        this.wantAnnouncements = false;
        this.wantEmails = false;
        this.contactMethod = "";
    }

    // Constructor với params cơ bản
    public User(String firstName, String lastName, String email) {
        this();
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
    }

    // Getters và Setters (giống class User cũ)
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getHearAboutUs() {
        return hearAboutUs;
    }

    public void setHearAboutUs(String hearAboutUs) {
        this.hearAboutUs = hearAboutUs;
    }

    public boolean isWantAnnouncements() {
        return wantAnnouncements;
    }

    public void setWantAnnouncements(boolean wantAnnouncements) {
        this.wantAnnouncements = wantAnnouncements;
    }

    public boolean isWantEmails() {
        return wantEmails;
    }

    public void setWantEmails(boolean wantEmails) {
        this.wantEmails = wantEmails;
    }

    public String getContactMethod() {
        return contactMethod;
    }

    public void setContactMethod(String contactMethod) {
        this.contactMethod = contactMethod;
    }
}