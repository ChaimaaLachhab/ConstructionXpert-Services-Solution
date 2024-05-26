package dao;

import connetion.DataBaseManager;
import model.Status;
import model.Task;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TaskDaoImp implements TaskDao {

    @Override
    public void addTask(Task task) {
        String sql = "INSERT INTO tasks (task_name, task_img, description, start_date, end_date, status) " +
                "VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, task.getTaskName());
            statement.setString(2, task.getTaskImg());
            statement.setString(3, task.getDescription());
            statement.setDate(4, task.getStartDate());
            statement.setDate(5, task.getEndDate());
            statement.setString(6, task.getStatus().toString());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateTask(Task task) {
        String sql = "UPDATE tasks SET task_name=?, task_img=?, description=?, start_date=?, end_date=?, status=? WHERE task_id=?";
        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, task.getTaskName());
            statement.setString(2, task.getTaskImg());
            statement.setString(3, task.getDescription());
            statement.setDate(4, task.getStartDate());
            statement.setDate(5, task.getEndDate());
            statement.setString(6, task.getStatus().toString());
            statement.setInt(7, task.getTaskId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteTask(Task task) {
        String sql = "DELETE FROM tasks WHERE task_id = ?";

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, task.getTaskId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Task> getTasks() {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT * FROM tasks";

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Task task = new Task();
                task.setTaskId(rs.getInt("task_id"));
                task.setTaskName(rs.getString("task_name"));
                task.setTaskImg(rs.getString("task_img"));
                task.setDescription(rs.getString("description"));
                task.setStartDate(rs.getDate("start_date"));
                task.setEndDate(rs.getDate("end_date"));
                task.setStatus(Status.valueOf(rs.getString("status")));
                tasks.add(task);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching tasks: " + e.getMessage());
        }

        return tasks;
    }

    @Override
    public List<Task> getAllTasksOfProject(int projectId) {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT * FROM tasks WHERE project_id = ?";

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, projectId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Task task = new Task();
                task.setTaskId(rs.getInt("task_id"));
                task.setTaskName(rs.getString("task_name"));
                task.setTaskImg(rs.getString("task_img"));
                task.setDescription(rs.getString("description"));
                task.setStartDate(rs.getDate("start_date"));
                task.setEndDate(rs.getDate("end_date"));
                task.setStatus(Status.valueOf(rs.getString("status")));
                tasks.add(task);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching tasks: " + e.getMessage());
        }

        return tasks;
    }

    @Override
    public Task getTask(int taskId) {
        Task task = null;
        String sql = "SELECT * FROM tasks WHERE task_id = ?";

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, taskId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                task = new Task();
                task.setTaskId(rs.getInt("task_id"));
                task.setTaskName(rs.getString("task_name"));
                task.setTaskImg(rs.getString("task_img"));
                task.setDescription(rs.getString("description"));
                task.setStartDate(rs.getDate("start_date"));
                task.setEndDate(rs.getDate("end_date"));
                task.setStatus(Status.valueOf(rs.getString("status")));
            }

        } catch (SQLException e) {
            System.err.println("Error fetching tasks: " + e.getMessage());
        }
        return task;
    }
}
