package servlets.project;
import dao.ProjectDaoImp;
import model.Project;
import model.ProjectType;
import model.ResourceType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet("/AddProjectServlet")
public class AddProjectServlet extends HttpServlet {
    private ProjectDaoImp projectDao;

    @Override
    public void init() {
        projectDao = new ProjectDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/project/add-project.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectName = request.getParameter("projectName");
        String projectImg = request.getParameter("projectImg");
        String description = request.getParameter("description");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        double budget = Double.parseDouble(request.getParameter("budget"));
        String type = request.getParameter("projectType");
        ProjectType projectType = ProjectType.valueOf(type);

        Project newProject = new Project(projectName, projectImg, description, startDate, endDate, budget, projectType);

        projectDao.create(newProject);

        response.sendRedirect(request.getContextPath() + "allProjects");
    }
}
