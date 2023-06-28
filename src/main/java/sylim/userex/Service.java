package sylim.userex;

import java.util.List;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Service {
    
    public List<UserDTO> execute(HttpServletRequest request, HttpServletResponse response);

}