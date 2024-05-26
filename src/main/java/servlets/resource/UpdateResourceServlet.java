package servlets.resource;

import dao.ResourceDaoImp;
import model.Resource;
import model.ResourceType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/UpdateResourceServlet")
public class UpdateResourceServlet extends HttpServlet {
    private ResourceDaoImp resourceDao;

    @Override
    public void init() {
        resourceDao = new ResourceDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        int resourceId = Integer.parseInt(request.getParameter("resourceId"));
        String resourceName = request.getParameter("resourceName");
        String resourceImg = request.getParameter("resourceImg");
        String type = request.getParameter("type");
        ResourceType resourceType = ResourceType.valueOf(type);
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String supplierInformation = request.getParameter("supplierInformation");

        Resource resource = new Resource(resourceName, resourceImg, resourceType, quantity, supplierInformation);
        resource.setResourceId(resourceId);

        resourceDao.updateResource(resource);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        String resourceName = request.getParameter("resourceName");
        String resourceImg = request.getParameter("resourceImg");
        String type = request.getParameter("type");
        ResourceType resourceType = ResourceType.valueOf(type);
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String supplierInformation = request.getParameter("supplierInformation");

        Resource newResource = new Resource(resourceName, resourceImg, resourceType, quantity, supplierInformation);

        resourceDao.updateResource(newResource);
        response.sendRedirect(request.getContextPath() + "/allResources?taskId=" + taskId);
    }
}
