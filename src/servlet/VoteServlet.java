package servlet;

import model.User;
import model.VoteDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class VoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        // 确保用户已登录
        if (user == null) {
            response.sendRedirect("voteSystem/login.jsp");
            return;
        }

        // 获取用户选择的大学ID
        int universityId = Integer.parseInt(request.getParameter("university"));





    // 使用 VoteDAO 来存储投票，并更新票数
        if (VoteDAO.recordVote(user.getId(), universityId)) {
            VoteDAO.incrementVoteCount(universityId); // 增加大学的票数
            response.sendRedirect("voteSystem/main.jsp"); // 投票成功，重定向到结果页面
        } else {
            response.sendRedirect("voteSystem/fail.jsp"); // 投票失败，跳转到错误页面
        }
    }
}
