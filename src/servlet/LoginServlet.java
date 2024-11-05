package servlet;

import model.User;
import model.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        User user = UserDAO.login(name, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("voteSystem/main.jsp");
        } else {
            response.sendRedirect("voteSystem/fail.jsp");
        }
    }
}
