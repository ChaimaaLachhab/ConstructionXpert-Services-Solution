package servlets.task;

import com.fasterxml.jackson.databind.ObjectMapper;
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
import java.util.Map;

@WebServlet("/UpdateTaskServlet")
public class UpdateTaskServlet extends HttpServlet {
    private TaskDaoImp taskDao;
    private ObjectMapper objectMapper = new ObjectMapper();


    @Override
    public void init() { taskDao = new TaskDaoImp(); }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        Task task = taskDao.getTask(taskId);
        request.setAttribute("task", task);
        request.setAttribute("projectId", projectId);
        request.getRequestDispatcher("/WEB-INF/task/update-task.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> jsonMap = objectMapper.readValue(request.getInputStream(), Map.class);
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        int projectId = Integer.parseInt(jsonMap.get("projectId"));
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        int taskId = Integer.parseInt(jsonMap.get("taskId"));
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        String taskName = jsonMap.get("taskName");
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        String taskImg = jsonMap.get("taskImg");
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        String description = jsonMap.get("taskDescription");
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        Date startDate = Date.valueOf(jsonMap.get("startDate"));
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        Date endDate = Date.valueOf(jsonMap.get("sndDate"));
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        Status status = Status.valueOf(jsonMap.get("status"));
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

        Task task = new Task(taskName, taskImg, description, startDate, endDate, status);
        task.setTaskId(taskId);
        System.out.println("task" + task);
        taskDao.updateTask(task);
        System.out.println("goooood");

        response.sendRedirect(request.getContextPath() + "/allTasks?projectId=" + projectId);
    }
}
