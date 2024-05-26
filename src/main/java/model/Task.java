package model;

import java.sql.Date;

public class Task {
    private int taskId;
    private Project project;
    private String taskName;
    private String taskImg;
    private String description;
    private Date startDate;
    private Date endDate;
    private Status status;

    public Task() {
    }

    public Task(String taskName, String taskImg, String description, Date startDate, Date endDate, Status status) {
        this.taskName = taskName;
        this.taskImg = taskImg;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }

    public Task(int taskId, String taskName, String description, Date startDate, Date endDate, Status status) {
        this.taskId = taskId;
        this.taskName = taskName;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskImg() { return taskImg; }

    public void setTaskImg(String taskImg) { this.taskImg = taskImg; }

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

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
