package dao;

import model.Resource;

import java.util.List;

public interface ResourceDao {
    void createResource(Resource resource);
    void updateResource(Resource resource);
    void deleteResource(Resource resource);
    List<Resource> getResources();
    List<Resource> getAllRessourcesOfTask(int taskId);
    Resource getResource(int id);
}
