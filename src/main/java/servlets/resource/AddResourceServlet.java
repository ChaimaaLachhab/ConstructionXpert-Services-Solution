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

@WebServlet("/AddResourceServlet")
public class AddResourceServlet extends HttpServlet {
    private ResourceDaoImp resourceDao;

    @Override
    public void init() {
        resourceDao = new ResourceDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        request.setAttribute("taskId", taskId);
        request.getRequestDispatcher("/WEB-INF/Resources/addResource.jsp").forward(request, response);
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

        resourceDao.createResource(newResource);
        response.sendRedirect(request.getContextPath() + "/allResources?taskId=" + taskId);
    }
}
