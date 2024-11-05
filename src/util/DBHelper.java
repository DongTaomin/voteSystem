package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBHelper {
    private static final String URL = "jdbc:mysql://localhost:3306/votedb"; // 数据库URL
    private static final String USER = "root"; // 数据库用户名
    private static final String PASSWORD = "dtm20031126"; // 数据库密码

    // 获取数据库连接
    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // 加载JDBC驱动
            connection = DriverManager.getConnection(URL, USER, PASSWORD); // 获取连接
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection; // 返回连接
    }
}
