<%--
  Created by IntelliJ IDEA.
  model.User: 86198
  Date: 2024/11/5
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>注册</title>
  <style>
    /* 页面整体样式 */
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f9;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
      color: #333;
    }

    /* 注册表单容器 */
    .register-container {
      background-color: #fff;
      padding: 20px 40px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      width: 300px;
      text-align: center;
    }

    /* 标题样式 */
    h2 {
      color: #4a90e2;
      margin-bottom: 20px;
    }

    /* 输入框和标签样式 */
    label {
      display: block;
      font-weight: bold;
      margin-top: 10px;
      text-align: left;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 8px;
      margin-top: 5px;
      margin-bottom: 15px;
      border: 1px solid #ddd;
      border-radius: 4px;
      box-sizing: border-box;
    }

    /* 性别选择项 */
    .gender-options {
      margin-top: 10px;
      margin-bottom: 15px;
      text-align: left;
    }

    .gender-options label {
      font-weight: normal;
      margin-right: 15px;
    }

    /* 提交按钮样式 */
    input[type="submit"] {
      background-color: #4a90e2;
      color: white;
      border: none;
      padding: 10px 20px;
      font-size: 16px;
      cursor: pointer;
      border-radius: 5px;
      width: 100%;
    }

    /* 提交按钮悬停样式 */
    input[type="submit"]:hover {
      background-color: #357ab8;
    }

    /* 链接样式 */
    .login-link {
      color: #4a90e2;
      text-decoration: none;
      display: inline-block;
      margin-top: 15px;
    }

    .login-link:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

<div class="register-container">
  <h2>用户注册</h2>
  <form action="/servlet.RegisterServlet" method="post">
    <label for="name">用户名:</label>
    <input type="text" name="name" id="name" required>

    <label for="password">密码:</label>
    <input type="password" name="password" id="password" required>

    <div class="gender-options">
      <label>性别:</label>
      <label><input type="radio" name="sex" value="男" required> 男</label>
      <label><input type="radio" name="sex" value="女"> 女</label>
    </div>

    <input type="submit" value="注册">
  </form>
  <a class="login-link" href="login.jsp">已有账号？登录</a>
</div>

</body>
</html>

