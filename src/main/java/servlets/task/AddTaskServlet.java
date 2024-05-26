package servlets.task;

import dao.ProjectDaoImp;
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

@WebServlet("/AddTaskServlet")
public class AddTaskServlet extends HttpServlet {
    private TaskDaoImp taskDao;
    private ProjectDaoImp projectDao;

    @Override
    public void init() {
        taskDao = new TaskDaoImp();
        projectDao = new ProjectDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            int projectId = Integer.parseInt(request.getParameter("projectId"));
            request.setAttribute("projectId", projectId);
            request.getRequestDispatcher("/WEB-INF/task/add-task.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        String taskName = request.getParameter("taskName");
        String taskImg = request.getParameter("taskImg");
        String description = request.getParameter("description");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        Status status = Status.valueOf(request.getParameter("status"));

        Task newTask = new Task(taskName, taskImg, description, startDate, endDate, status);

        taskDao.addTask(newTask);
            response.sendRedirect(request.getContextPath() + "/allTasks?projectId=" + projectId);
    }
}
