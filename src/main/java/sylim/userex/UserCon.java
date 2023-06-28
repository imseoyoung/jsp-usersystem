package sylim.userex;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class UserCon
 */
@WebServlet("*.do")
public class UserCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCon() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doGet");
        actionDo(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doPost");
        actionDo(request, response);
    }

    private void actionDo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("actionDo");
        String uri = request.getRequestURI();
        System.out.println("uri : " + uri);

        String conPath = request.getContextPath();
        System.out.println("conPath : " + conPath);

        String command = uri.substring(conPath.length());
        System.out.println("command : " + command);
        
        
        
        if (command.equals("/userselect.do")) {
            // UserService 인스턴스 생성
            Service userService = new UserService();

            // UserService의 execute 메서드 호출하여 사용자 목록 가져오기
            List<UserDTO> userList = userService.execute(request, response);
            
            for (UserDTO user : userList) {
                System.out.println(user.getId() + " " + user.getName() + " " + user.getPassword() + " " + user.getPhone() +
                        " " + user.getEmail() + " " + user.getUserstatus() + " " + user.getUserrole());
            }

            // 가져온 사용자 목록을 request에 저장
            request.setAttribute("userList", userList);

            // userList.jsp로 포워딩
            RequestDispatcher dispatcher = request.getRequestDispatcher("/userList.jsp");
            dispatcher.forward(request, response);
            
        } else {
            System.out.println("연결 실패");
        }
    }

}