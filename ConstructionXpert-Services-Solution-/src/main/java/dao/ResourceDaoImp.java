package dao;

import model.Resource;
import model.ResourceType;
import connetion.DataBaseManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ResourceDaoImp implements ResourceDao {

    @Override
    public void create(Resource resource) {
        String sql = "INSERT INTO resources (resource_name, type, quantity, supplier_information) " +
                "VALUES (?, ?, ?, ?)";

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, resource.getResourceName());
            statement.setString(2, resource.getType().toString());
            statement.setInt(3, resource.getQuantity());
            statement.setString(4, resource.getSupplierInformation());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Resource resource) {
        String sql = "UPDATE resources SET resource_name=?, type=?, quantity=?, supplier_information=? WHERE resource_id=?";
        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, resource.getResourceName());
            statement.setString(2, resource.getType().toString());
            statement.setInt(3, resource.getQuantity());
            statement.setString(4, resource.getSupplierInformation());
            statement.setInt(5, resource.getResourceId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Resource resource) {
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
    public List<Resource> getAll() {
        List<Resource> resources = new ArrayList<>();
        String sql = "SELECT * FROM resources";

        try (Connection connection = DataBaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Resource resource = new Resource();
                resource.setResourceId(rs.getInt("resource_id"));
                resource.setResourceName(rs.getString("resource_name"));
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
    public Resource findById(int id) {
        // Implementation to find a resource by its ID from the database
        return null;
    }
}
