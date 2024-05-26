package servlets.task;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.ProjectDaoImp;
import dao.TaskDaoImp;
import model.Project;
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
import java.util.Map;

@WebServlet("/AddTaskServlet")
public class AddTaskServlet extends HttpServlet {
    private TaskDaoImp taskDao;
    private ProjectDaoImp projectDao;
    private ObjectMapper objectMapper = new ObjectMapper();


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
        Map<String, String> jsonMap = objectMapper.readValue(request.getInputStream(), Map.class);
        int projectId = Integer.parseInt(jsonMap.get("projectId"));
        Project project = projectDao.getProject(projectId);
        System.out.println("projectId");
        String taskName = jsonMap.get("taskName");
        System.out.println("taskName");
        String taskImg = jsonMap.get("taskImg");
        System.out.println("taskImg");
        String description = jsonMap.get("description");
        System.out.println("description");
        Date startDate = Date.valueOf(jsonMap.get("startDate"));
        System.out.println("startDate");
        Date endDate = Date.valueOf(jsonMap.get("endDate"));
        System.out.println("endDate");
        Status status = Status.valueOf(jsonMap.get("taskStatus"));
        System.out.println("status");

        Task newTask = new Task(project,taskName, taskImg, description, startDate, endDate, status);
        System.out.println("new task" + newTask.toString());
        taskDao.addTask(newTask);
        System.out.println("goooooooooooooooooooooooooooooooood");
            response.sendRedirect(request.getContextPath() + "/allTasks?projectId=" + projectId);
    }
}
