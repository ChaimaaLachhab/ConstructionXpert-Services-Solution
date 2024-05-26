package servlets.resource;

import dao.ResourceDaoImp;
import dao.TaskDao;
import dao.TaskDaoImp;
import model.Resource;
import model.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/allResources")
public class ListResourcesServlet extends HttpServlet {
    private TaskDao taskDao;
    private ResourceDaoImp resourceDao;


    @Override
    public void init() {
        taskDao = new TaskDaoImp();
        resourceDao = new ResourceDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        Task oneTask = taskDao.getTask(taskId);
        request.setAttribute("oneTask", oneTask);
        List<Resource> resources = resourceDao.getAllRessourcesOfTask(taskId);
        request.setAttribute("resources", resources);
        request.getRequestDispatcher("/WEB-INF/task-single.jsp").forward(request, response);
    }
}
