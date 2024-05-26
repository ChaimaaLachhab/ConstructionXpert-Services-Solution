package servlets.project;

import dao.ProjectDaoImp;
import model.Project;
import model.ProjectType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet("/UpdateProjectServlet")
public class UpdateProjectServlet extends HttpServlet {
    private ProjectDaoImp projectDao;

    @Override
    public void init() {
        projectDao = new ProjectDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));

        Project existingProject = projectDao.getProject(projectId);
        request.setAttribute("project", existingProject);
        request.getRequestDispatcher("/WEB-INF/project/update-project.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        String projectName = request.getParameter("projectName");
        String projectImg = request.getParameter("projectImg");
        String description = request.getParameter("description");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        double budget = Double.parseDouble(request.getParameter("budget"));
        String type = request.getParameter("projectType");
        ProjectType projectType = ProjectType.valueOf(type);

        Project project = new Project(projectName, projectImg, description, startDate, endDate, budget, projectType);
        project.setProjectId(projectId);

        projectDao.update(project);
            response.sendRedirect(request.getContextPath() + "allTasks");
    }
}
