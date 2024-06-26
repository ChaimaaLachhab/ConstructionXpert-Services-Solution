package dao;

import model.Project;

import java.util.List;

public interface ProjectDao {
    void create(Project project);
    void update(Project project);
    void delete(Project project);
    Project getProject(int id);
    List<Project> getAll();
    List<Project> getAllLimit();
}
