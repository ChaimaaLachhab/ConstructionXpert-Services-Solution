package model;

import java.sql.Date;

public class Project {
    private int projectId;
    private String projectName;
    private String projectImg;
    private String description;
    private Date startDate;
    private Date endDate;
    private double budget;
    private ProjectType projectType;

    public Project() {
    }

    public Project(String projectName, String projectImg, String description, Date startDate, Date endDate, double budget, ProjectType projectType) {
        this.projectName = projectName;
        this.projectImg = projectImg;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.budget = budget;
        this.projectType = projectType;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectImg() { return projectImg; }

    public void setProjectImg(String projectImg) { this.projectImg = projectImg; }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public double getBudget() {
        return budget;
    }

    public void setBudget(double budget) {
        this.budget = budget;
    }

    public ProjectType getProjectType() { return projectType; }

    public void setProjectType(ProjectType projectType) { this.projectType = projectType; }

    @Override
    public String toString() {
        return "Project{" +
                "projectId=" + projectId +
                ", projectName='" + projectName + '\'' +
                ", projectImg='" + projectImg + '\'' +
                ", description='" + description + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", budget=" + budget +
                ", projectType=" + projectType +
                '}';
    }
}
