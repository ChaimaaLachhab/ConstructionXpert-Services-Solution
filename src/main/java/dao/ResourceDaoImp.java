package dao;

import connetion.DataBaseManager;
import model.Resource;
import model.ResourceType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ResourceDaoImp implements ResourceDao {

    @Override
    public void createResource(Resource resource) {
        String sql = "INSERT INTO resources (resource_name, resource_img, type, quantity, supplier_information) " +
                "VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, resource.getResourceName());
            statement.setString(2, resource.getResourceImg());
            statement.setString(3, resource.getType().toString());
            statement.setInt(4, resource.getQuantity());
            statement.setString(5, resource.getSupplierInformation());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateResource(Resource resource) {
        String sql = "UPDATE resources SET resource_name=?, resource_img=?, type=?, quantity=?, supplier_information=? WHERE resource_id=?";
        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, resource.getResourceName());
            statement.setString(2, resource.getResourceImg());
            statement.setString(3, resource.getType().toString());
            statement.setInt(4, resource.getQuantity());
            statement.setString(5, resource.getSupplierInformation());
            statement.setInt(6, resource.getResourceId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteResource(Resource resource) {
        String sql = "DELETE FROM resources WHERE resource_id = ?";

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, resource.getResourceId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Resource> getResources() {
        List<Resource> resources = new ArrayList<>();
        String sql = "SELECT * FROM resources";

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Resource resource = new Resource();
                resource.setResourceId(rs.getInt("resource_id"));
                resource.setResourceName(rs.getString("resource_name"));
                resource.setResourceImg(rs.getString("resource_img"));

                // Convert string to enum
                resource.setType(ResourceType.valueOf(rs.getString("type")));
                resource.setQuantity(rs.getInt("quantity"));
                resource.setSupplierInformation(rs.getString("supplier_information"));
                resources.add(resource);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching resources: " + e.getMessage());
        }

        return resources;
    }

    @Override
    public List<Resource> getAllRessourcesOfTask(int taskId) {
        List<Resource> resources = new ArrayList<>();
        String sql = "SELECT * FROM resources WHERE task_id = ?";

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, taskId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Resource resource = new Resource();
                resource.setResourceId(rs.getInt("resource_id"));
                resource.setResourceName(rs.getString("resource_name"));
                resource.setResourceImg(rs.getString("resource_img"));
                // Convert string to enum
                resource.setType(ResourceType.valueOf(rs.getString("type")));
                resource.setQuantity(rs.getInt("quantity"));
                resource.setSupplierInformation(rs.getString("supplier_information"));
                resources.add(resource);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching resources: " + e.getMessage());
        }

        return resources;
    }

    @Override
    public Resource getResource(int resourceId) {
        Resource resource = null;
        String sql = "SELECT * FROM resources WHERE resource_id = ?";

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, resourceId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                resource = new Resource();
                resource.setResourceId(rs.getInt("resource_id"));
                resource.setResourceName(rs.getString("resource_name"));
                resource.setResourceImg(rs.getString("resource_img"));
                // Convert string to enum
                resource.setType(ResourceType.valueOf(rs.getString("type")));
                resource.setQuantity(rs.getInt("quantity"));
                resource.setSupplierInformation(rs.getString("supplier_information"));
            }

        } catch (SQLException e) {
            System.err.println("Error fetching resources: " + e.getMessage());
        }

        return resource;
    }
}
