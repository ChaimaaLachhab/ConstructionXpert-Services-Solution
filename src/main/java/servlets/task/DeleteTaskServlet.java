package servlets.task;

import dao.TaskDaoImp;
import model.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteTaskServlet")
public class DeleteTaskServlet extends HttpServlet {
    private TaskDaoImp taskDao;

    @Override
    public void init() {
        taskDao = new TaskDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        Task task = taskDao.getTask(taskId);
        if (task != null) {
            taskDao.deleteTask(task);
        }
        response.sendRedirect(request.getContextPath() + "/allTasks?projectId=" + projectId);
    }
}
