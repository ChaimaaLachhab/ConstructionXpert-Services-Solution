package servlets.resource;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.ResourceDao;
import dao.ResourceDaoImp;
import dao.TaskDao;
import dao.TaskDaoImp;
import model.Resource;
import model.ResourceType;
import model.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

@WebServlet("/AddResourceServlet")
public class AddResourceServlet extends HttpServlet {
    private TaskDao taskdao;
    private ResourceDao resourceDao;
    private ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public void init() {
        resourceDao = new ResourceDaoImp();
        taskdao = new TaskDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        request.setAttribute("taskId", taskId);
        request.getRequestDispatcher("/WEB-INF/resource/add-resource.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> jsonMap = objectMapper.readValue(request.getInputStream(), Map.class);


        int taskId = Integer.parseInt(jsonMap.get("taskId"));
        System.out.println("taskId = " + taskId);
        Task task = taskdao.getTask(taskId);
        String resourceName = jsonMap.get("resourceName");
        System.out.println("resourceName = " + resourceName);
        String resourceImg = jsonMap.get("resourceImg");
        System.out.println("resourceImg = " + resourceImg);
        String type = jsonMap.get("resourceType");
        System.out.println("type = " + type);
        ResourceType resourceType = ResourceType.valueOf(type);
        System.out.println("resourceType = " + resourceType);

        int quantity = Integer.parseInt(jsonMap.get("quantity"));
        System.out.println("quantity = " + quantity);
        String supplierInformation = jsonMap.get("supplierInformation");
        System.out.println("supplierInformation = " + supplierInformation);

        Resource newResource = new Resource(task, resourceName, resourceImg, resourceType, quantity, supplierInformation);

        resourceDao.createResource(newResource);
        System.out.println("goooooooooooooooooooooooooooooooood");
        response.sendRedirect(request.getContextPath() + "/allResources?taskId=" + taskId);
    }
}
