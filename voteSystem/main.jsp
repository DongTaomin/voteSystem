<%--
  Created by IntelliJ IDEA.
  model.User: 86198
  Date: 2024/11/5
  Time: 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.UniversityDAO" %>
<%@ page import="model.University" %>
<%
    // 假设这里有一个方法来检查用户是否已登录
    boolean isLoggedIn = (session.getAttribute("user") != null);
%>
<html>
<head>
    <title>喜欢的大学投票系统</title>
    <script>
        function checkLogin() {
            <%-- 如果用户未登录，则显示弹窗 --%>
            var loggedIn = <%= isLoggedIn ? "true" : "false" %>;
            if (!loggedIn) {
                alert("请登录后再投票！");
                return false; // 阻止表单提交
            }
            return true; // 允许表单提交
        }
       
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
            padding: 0;
            color: #333;
        }
        h2 {
            color: #4a90e2;
        }
        table {
            width: 60%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #4a90e2;
            color: white;
        }
        td {
            background-color: #f9f9f9;
        }
        form {
            margin-top: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: left;
            width: 60%;
        }
        input[type="radio"] {
            margin-right: 8px;
        }
        input[type="submit"] {
            background-color: #4a90e2;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }
        input[type="submit"]:hover {
            background-color: #357ab8;
        }
        a {
            color: #4a90e2;
            text-decoration: none;
            margin-right: 10px;
        }
        a:hover {
            text-decoration: underline;
        }
        .links {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>

<h2>大学投票结果</h2>
<table>
    <tr>
        <th>大学名称</th>
        <th>票数</th>
    </tr>
    <%
        List<University> universities = UniversityDAO.getAllUniversities();
        for (University university : universities) {
    %>
    <tr>
        <td><%= university.getName() %></td>
        <td><%= university.getVoteCount() %></td>
    </tr>
    <% } %>
</table>

<h2>请选择你最喜欢的大学</h2>
<form action="/servlet.VoteServlet" method="post" onsubmit="return checkLogin();">
    <%
        for (University university : universities) {
    %>
    <input type="radio" name="university" value="<%= university.getId() %>">
    <%= university.getName() %><br>
    <% } %>
    <input type="submit" value="投票">
</form>

<div class="links">
    <a href="login.jsp">登录</a> | <a href="register.jsp">注册</a>
</div>

</body>
</html>




