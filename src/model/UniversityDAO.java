package model;

import util.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UniversityDAO {
    public static List<University> getAllUniversities() {
        List<University> universities = new ArrayList<>();
        String sql = "SELECT id, name, vote_count FROM universities";
        try (Connection conn = DBHelper.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                University university = new University();
                university.setId(rs.getInt("id"));
                university.setName(rs.getString("name"));
                university.setVoteCount(rs.getInt("vote_count"));
                universities.add(university);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return universities;
    }
}
