package model;

public class User {

    public String name,username,email,dob,password;
    public int id;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User()
    {
        this.name = "";
        this.email = "";
        this.dob = "";
        this.password = "";
    }
    public  User(String name,String password)
    {
        this.name = name;
        this.password = password;
    }
    public User(int id,String name,String email)
    {
        this.name = name;
        this.email = email;
    }
    public User(String name, String username, String email, String dob, String password) {
        this.name = name;
        this.username = username;
        this.email = email;
        this.dob = dob;
        this.password = password;
    }

    public User(String name, String email, String dob, String password) {
        this.name = name;
        this.email = email;
        this.dob = dob;
        this.password = password;
    }
    public User(String name, String email, String dob) {
        this.name = name;
        this.email = email;
        this.dob = dob;
    }
    public User(int id,String name, String email, String dob) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.dob = dob;
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

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
