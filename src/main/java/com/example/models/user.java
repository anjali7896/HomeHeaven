package com.example.models;

public class user {
    private String fullName;
    private String email;
    private String password;
    private String dob;
    private String aadhar;
    private String phone;

    public user(String fullName, String email, String password, String dob, String aadhar, String phone) {
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.aadhar = aadhar;
        this.phone = phone;
    }

    public String getFullName() { return fullName; }
    public String getEmail() { return email; }
    public String getPassword() { return password; }
    public String getDob() { return dob; }
    public String getAadhar() { return aadhar; }
    public String getPhone() { return phone; }
}
