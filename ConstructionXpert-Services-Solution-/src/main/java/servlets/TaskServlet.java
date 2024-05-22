package servlets;

import dao.TaskDao;
import dao.TaskDaoImp;
import model.Status;
import model.Task;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "TaskServlet", value = "/TaskServlet")
public class TaskServlet extends HttpServlet {
    private TaskDao taskDao;

    public TaskServlet() {
        super();
        taskDao = new TaskDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "getAllTasks":
                getAllTasks(request, response);
                break;
            case "deleteTask":
                deleteTask(request, response);
                break;
            case "editTask":
                editTask(request, response);
                break;
            case "addTask":
                addTask(request, response);
                break;
            default:

                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void getAllTasks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Task> tasks = taskDao.getTasks();
        request.setAttribute("tasks", tasks);
        RequestDispatcher dispatcher = request.getRequestDispatcher("tasks.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        Task task = taskDao.getTask(taskId);
        if (task != null) {
            taskDao.deleteTask(task);
        }
        response.sendRedirect("ProjectServlet?action=getAllTasks");
    }

    private void editTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        String taskName = request.getParameter("taskName");
        String description = request.getParameter("description");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        Status status = Status.valueOf(request.getParameter("status"));

        Task task = new Task(taskId, taskName, description, startDate, endDate, status);

        taskDao.updateTask(task);

        response.sendRedirect("ProjectServlet?action=getAllTasks");
    }

    private void addTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les données de la requête pour la nouvelle tâche
        String taskName = request.getParameter("taskName");
        String description = request.getParameter("description");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        Status status = Status.valueOf(request.getParameter("status"));

        Task newTask = new Task(taskName, description, startDate, endDate, status);

        taskDao.addTask(newTask);

        response.sendRedirect("ProjectServlet?action=getAllTasks");
    }

}
