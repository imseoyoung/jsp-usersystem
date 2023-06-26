package sylim.userex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    DataSource ds = null;
    
    public UserDAO() {
//        try {
//            Class.forName("oracle.jdbc.driver.OracleDriver");
//        } catch(Exception e) {
//            e.printStackTrace();
//        }
        
        try {
            Context ctx = new InitialContext();
            ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
        } catch(Exception e) {
            e.printStackTrace();       
        }
    }
    
    public List<UserDTO> getAllUsers() {
        List<UserDTO> userList = new ArrayList<>();

        try (Connection conn = ds.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM USERS WHERE userrole = ?");
        ) {
            pstmt.setString(1, "일반사용자");

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    String password = rs.getString("password");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String userstatus = rs.getString("userstatus");
                    String userrole = rs.getString("userrole");

                    UserDTO user = new UserDTO(id, name, password, phone, email, userstatus, userrole);
                    userList.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }
    
    public UserDTO getUserById(String id) {
        UserDTO user = null;
        
        try (Connection conn = ds.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM USERS WHERE id = ?")) {
            pstmt.setString(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String name = rs.getString("name");
                    String password = rs.getString("password");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String userstatus = rs.getString("userstatus");
                    String userrole = rs.getString("userrole");
                    
                    user = new UserDTO(id, name, password, phone, email, userstatus, userrole);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return user;
    }
                
    public int insertUser(UserDTO user) {
        int result = 0;

        try (Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement("INSERT INTO USERS (id, name, password, phone, email, userstatus, userrole) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?)")) {           
                pstmt.setString(1, user.getId());
                pstmt.setString(2, user.getName());
                pstmt.setString(3, user.getPassword());
                pstmt.setString(4, user.getPhone());
                pstmt.setString(5, user.getEmail());
                pstmt.setString(6, user.getUserstatus());
                pstmt.setString(7, user.getUserrole());
                
                result = pstmt.executeUpdate();               
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        
        return result;
    }
    
    public int deleteUser(String userId) {
        int result = 0;

        try (Connection conn = ds.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("DELETE FROM USERS WHERE id = ?")) {
            pstmt.setString(1, userId);

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    
    public int updateUser(UserDTO user) {
        int result = 0;
        
        try (Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement("UPDATE USERS SET name = ?, password = ?, phone = ?, email = ? " +
                        "WHERE id = ?")) {
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getPhone());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getId());
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return result;
    }
    
    public List<UserDTO> getUsersByStatus(String status) {
        List<UserDTO> userList = new ArrayList<>();

        try (Connection conn = ds.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM USERS WHERE userstatus = ?")) {
            pstmt.setString(1, status);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    String password = rs.getString("password");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String userstatus = rs.getString("userstatus");
                    String userrole = rs.getString("userrole");

                    UserDTO user = new UserDTO(id, name, password, phone, email, userstatus, userrole);
                    userList.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }
    
    
    public int updateUserStatus(UserDTO user) {
        int result = 0;

        try (Connection conn = ds.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("UPDATE USERS SET userstatus = ? WHERE id = ?")) {
            pstmt.setString(1, user.getUserstatus());
            pstmt.setString(2, user.getId());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

}
