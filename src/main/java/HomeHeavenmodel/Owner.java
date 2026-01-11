package HomeHeavenmodel;

public class Owner {

    private int id;                     // NEW
    private String name;
    private String email;
    private String phone;
    private String dob;
    private String idType;
    private String idNumber;
    private String password;
    private java.sql.Timestamp createdAt; // NEW

    // Empty constructor (REQUIRED for JSP/Servlet DB fetching)
    public Owner() {}

    // Full constructor (optional)
    public Owner(String name, String email, String phone,
                 String dob, String idType, String idNumber, String password) {

        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.dob = dob;
        this.idType = idType;
        this.idNumber = idNumber;
        this.password = password;
        this.createdAt = createdAt;
    }

    // Getters
    public int getId() { return id; }
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getPhone() { return phone; }
    public String getDob() { return dob; }
    public String getIdType() { return idType; }
    public String getIdNumber() { return idNumber; }
    public String getPassword() { return password; }
   

    // Setters
    public void setId(int id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setEmail(String email) { this.email = email; }
    public void setPhone(String phone) { this.phone = phone; }
    public void setDob(String dob) { this.dob = dob; }
    public void setIdType(String idType) { this.idType = idType; }
    public void setIdNumber(String idNumber) { this.idNumber = idNumber; }
    public void setPassword(String password) { this.password = password; }
    
}
