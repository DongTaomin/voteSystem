package model;

public class Vote {
    private int id;
    private int userId;
    private int universityId;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getUniversityId() { return universityId; }
    public void setUniversityId(int universityId) { this.universityId = universityId; }
}
