package servlet;

import model.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String sex = request.getParameter("sex");

        boolean isRegistered = UserDAO.register(name, password, sex);
        if (isRegistered) {
            response.sendRedirect("voteSystem/main.jsp");
        } else {
            response.sendRedirect("voteSystem/fail.jsp");
        }
    }
}
