package servlets.resource;

import dao.ResourceDaoImp;
import model.Resource;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteResourceServlet")
public class DeleteResourceServlet extends HttpServlet {
    private ResourceDaoImp resourceDao;

    @Override
    public void init() {
        resourceDao = new ResourceDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        int resourceId = Integer.parseInt(request.getParameter("resourceId"));
        Resource resource = resourceDao.getResource(resourceId);
        if (resource != null) {
            resourceDao.deleteResource(resource);
        }

        response.sendRedirect(request.getContextPath() + "/allResources?taskId=" + taskId);
    }
}
