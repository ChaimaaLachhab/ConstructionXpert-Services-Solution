package dao;

import model.Task;

import java.util.List;

public interface TaskDao {
    void addTask(Task task);
    void updateTask(Task task);
    void deleteTask(Task task);
    List<Task> getTasks();
    Task getTask(int id);
}
