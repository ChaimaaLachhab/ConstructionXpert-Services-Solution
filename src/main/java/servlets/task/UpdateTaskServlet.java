package servlets.task;

import dao.TaskDaoImp;
import model.Status;
import model.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet("/UpdateTaskServlet")
public class UpdateTaskServlet extends HttpServlet {
    private TaskDaoImp taskDao;

    @Override
    public void init() {
        taskDao = new TaskDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        Task task = taskDao.getTask(taskId);
        request.setAttribute("task", task);
        request.setAttribute("projectId", projectId);
        request.getRequestDispatcher("/WEB-INF/Tasks/updateTask.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        String taskName = request.getParameter("taskName");
        String description = request.getParameter("description");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        Status status = Status.valueOf(request.getParameter("status"));

        Task task = new Task(taskId, taskName, description, startDate, endDate, status);
        taskDao.updateTask(task);
        response.sendRedirect(request.getContextPath() + "/allTasks?projectId=" + projectId);
    }
}
