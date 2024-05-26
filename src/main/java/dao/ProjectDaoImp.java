package dao;

import connetion.DataBaseManager;
import model.Project;
import model.ProjectType;
import model.ResourceType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProjectDaoImp implements ProjectDao {

    @Override
    public void create(Project project) {
        String sql = "INSERT INTO projects (project_name, project_img, description, start_date, end_date, budget, type_project) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, project.getProjectName());
            statement.setString(2, project.getProjectImg());
            statement.setString(3, project.getDescription());
            statement.setDate(4, project.getStartDate());
            statement.setDate(5, project.getEndDate());
            statement.setDouble(6, project.getBudget());
            statement.setString(7, project.getProjectType().toString());

            statement.executeUpdate();

            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                project.setProjectId(generatedKeys.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Project project) {
        String sql = "UPDATE projects SET project_name=?, project_img=?, description=?, start_date=?, end_date=?, budget=?, type_project=? WHERE project_id=?";

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, project.getProjectName());
            statement.setString(2, project.getProjectImg());
            statement.setString(3, project.getDescription());
            statement.setDate(4, project.getStartDate());
            statement.setDate(5, project.getEndDate());
            statement.setDouble(6, project.getBudget());
            statement.setString(7, project.getProjectType().toString());
            statement.setInt(8, project.getProjectId());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Project project) {
        String sql = "DELETE FROM projects WHERE project_id = ?";

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, project.getProjectId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Project getProject(int id) {
        String sql = "SELECT * FROM projects WHERE project_id = ?";
        Project project = null;

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);

            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                project = new Project();
                project.setProjectId(rs.getInt("project_id"));
                project.setProjectName(rs.getString("project_name"));
                project.setProjectImg(rs.getString("project_img"));
                project.setDescription(rs.getString("description"));
                project.setStartDate(rs.getDate("start_date"));
                project.setEndDate(rs.getDate("end_date"));
                project.setBudget(rs.getDouble("budget"));
                project.setProjectType(ProjectType.valueOf(rs.getString("type_project")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return project;
    }

    @Override
    public List<Project> getAll() {
        List<Project> projects = new ArrayList<>();
        String sql = "SELECT * FROM projects";

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Project project = new Project();
                project.setProjectId(rs.getInt("project_id"));
                project.setProjectName(rs.getString("project_name"));
                project.setProjectImg(rs.getString("project_img"));
                project.setDescription(rs.getString("description"));
                project.setStartDate(rs.getDate("start_date"));
                project.setEndDate(rs.getDate("end_date"));
                project.setBudget(rs.getDouble("budget"));
                project.setProjectType(ProjectType.valueOf(rs.getString("type_project")));
                projects.add(project);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching projects: " + e.getMessage());
        }

        return projects;
    }

    @Override
    public List<Project> getAllLimit() {
        List<Project> projects = new ArrayList<>();
        String sql = "SELECT * FROM projects LIMIT 3";

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Project project = new Project();
                project.setProjectId(rs.getInt("project_id"));
                project.setProjectName(rs.getString("project_name"));
                project.setProjectImg(rs.getString("project_img"));
                project.setDescription(rs.getString("description"));
                project.setStartDate(rs.getDate("start_date"));
                project.setEndDate(rs.getDate("end_date"));
                project.setBudget(rs.getDouble("budget"));
                project.setProjectType(ProjectType.valueOf(rs.getString("type_project")));
                projects.add(project);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching projects: " + e.getMessage());
        }

        return projects;
    }

}
