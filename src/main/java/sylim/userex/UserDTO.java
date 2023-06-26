package sylim.userex;

public class UserDTO {
    private String id;
    private String name;
    private String password;
    private String phone;
    private String email;
    private String userstatus;
    private String userrole;
    
    public UserDTO(String id, String name, String password, String phone, String email,
            String userstatus, String userrole) {
        super();
        this.id = id;
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.userstatus = userstatus;
        this.userrole = userrole;
    }
    
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getUserstatus() {
        return userstatus;
    }
    public void setUserstatus(String userstatus) {
        this.userstatus = userstatus;
    }
    public String getUserrole() {
        return userrole;
    }
    public void setUserrole(String userrole) {
        this.userrole = userrole;
    }
    
}
