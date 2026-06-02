package adminLogin;

public class Admin {
    private int AdminID; // Ensure the type is correct, use Integer if AdminID is nullable
    private String AdminName;
    private String password;

    // Constructor
    public Admin(int adminID, String adminName, String password) {
        this.AdminID = adminID;
        this.AdminName = adminName;
        this.password = password;
    }

    // Getters
    public int getAdminID() {
        return AdminID;
    }

    public String getAdminName() {
        return AdminName;
    }

    public String getPassword() {
        return password;
    }
}
