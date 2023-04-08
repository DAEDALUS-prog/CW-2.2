package by.timmy.calories.person;

import jakarta.persistence.*;

@Entity
@Table
public class Person {

    @Id
    @SequenceGenerator(
            name="person_sequence",
            sequenceName="person_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "person_sequence"
    )
    private Long id;
    private String name;
    private String email;
    private Integer status;
    private String password;


    public Person() {
    }

    public Person(Long id,
                  String name,
                  String email,
                  Integer status,
                  String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.status = status;
        this.password = password;
    }

    public Person(String name,
                  String email,
                  Integer status,
                  String password) {
        this.name = name;
        this.email = email;
        this.status = status;
        this.password = password;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Person{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", status=" + status +
                ", password='" + password + '\'' +
                '}';
    }
}
