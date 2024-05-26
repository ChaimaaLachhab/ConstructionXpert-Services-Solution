package servlets.task;

import dao.ProjectDaoImp;
import dao.TaskDaoImp;
import model.Project;
import model.Task;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/allTasks")
public class ListTasksServlet extends HttpServlet {
    private ProjectDaoImp projectDao;
    private TaskDaoImp taskDao;

    @Override
    public void init() {
        projectDao = new ProjectDaoImp();
        taskDao = new TaskDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));

        Project oneProject = projectDao.getProject(projectId);
        request.setAttribute("oneProject", oneProject);
        List<Task> tasks = taskDao.getAllTasksOfProject(projectId);
        request.setAttribute("tasks", tasks);
        request.getRequestDispatcher("/WEB-INF/projects-single.jsp").forward(request, response);
    }
}
