package servlets;

import dao.ResourceDao;
import dao.ResourceDaoImp;
import model.Resource;
import model.ResourceType;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ResourceServlet", value = "/ResourceServlet")
public class ResourceServlet extends HttpServlet {
    private ResourceDao resourceDao;

    public ResourceServlet() {
        super();
        resourceDao = new ResourceDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "getAllResources":
                getAllResources(request, response);
                break;
            case "deleteResource":
                deleteResource(request, response);
                break;
            case "editResource":
                editResource(request, response);
                break;
            case "addResource":
                addResource(request, response);
                break;
            default:

                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void getAllResources(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Resource> resources = resourceDao.getAll();
        request.setAttribute("resources", resources);
        RequestDispatcher dispatcher = request.getRequestDispatcher("resources.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteResource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int resourceId = Integer.parseInt(request.getParameter("resourceId"));
        Resource resource = resourceDao.findById(resourceId);
        if (resource != null) {
            resourceDao.delete(resource);
        }
        response.sendRedirect("ResourceServlet?action=getAllResources");
    }

    private void editResource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int resourceId = Integer.parseInt(request.getParameter("resourceId"));
        String resourceName = request.getParameter("resourceName");
        String type = request.getParameter("type");
        ResourceType resourceType = ResourceType.valueOf(type);
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String supplierInformation = request.getParameter("supplierInformation");

        Resource resource = new Resource(resourceName, resourceType, quantity, supplierInformation);
        resource.setResourceId(resourceId);

        resourceDao.update(resource);

        response.sendRedirect("ResourceServlet?action=getAllResources");
    }


    private void addResource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String resourceName = request.getParameter("resourceName");
        String type = request.getParameter("type");
        ResourceType resourceType = ResourceType.valueOf(type);
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String supplierInformation = request.getParameter("supplierInformation");

        Resource newResource = new Resource(resourceName, resourceType, quantity, supplierInformation);

        resourceDao.create(newResource);

        response.sendRedirect("ResourceServlet?action=getAllResources");
    }

}
