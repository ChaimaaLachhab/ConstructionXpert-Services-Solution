package dao;

import model.Resource;

import java.util.List;

public interface ResourceDao {
    void create(Resource resource);
    void update(Resource resource);
    void delete(Resource resource);
    List<Resource> getAll();
    Resource findById(int id);
}
