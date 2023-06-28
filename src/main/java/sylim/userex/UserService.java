package sylim.userex;

import java.util.List;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserService implements Service {
    
    @Override
    public List<UserDTO> execute(HttpServletRequest request, HttpServletResponse response) {
        UserDAO userDAO = new UserDAO();
        
        return userDAO.getAllUsers();
    }
}