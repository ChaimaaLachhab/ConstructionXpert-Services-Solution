package servlets;

import dao.ProjectDao;
import dao.ProjectDaoImp;
import model.Project;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "ProjectServlet", value = "/ProjectServlet")
public class ProjectServlet extends HttpServlet {
    private ProjectDao projectDao;

    public ProjectServlet() {
        super();
        projectDao = new ProjectDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "getAllProjects":
                getAllProjects(request, response);
                break;
            case "deleteProject":
                deleteProject(request, response);
                break;
            case "editProject":
                editProject(request, response);
                break;
            case "addProject":
                addProject(request, response);
                break;
            default:

                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void getAllProjects(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Project> projects = projectDao.getAll();
        request.setAttribute("projects", projects);
        RequestDispatcher dispatcher = request.getRequestDispatcher("projects.jsp");
        dispatcher.forward(request, response);
        request.setAttribute("projects", projects);
    }

    private void deleteProject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        Project project = projectDao.get(projectId);
        if (project != null) {
            projectDao.delete(project);
        }
        response.sendRedirect("ProjectServlet?action=getAllProjects");
    }

    private void editProject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        String projectName = request.getParameter("projectName");
        String description = request.getParameter("description");
        Date startDate = Date.valueOf(request.getParameter("startDate")); // Assurez-vous d'importer java.sql.Date
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        double budget = Double.parseDouble(request.getParameter("budget"));

        Project project = new Project(projectName, description, startDate, endDate, budget);
        project.setProjectId(projectId);

        projectDao.update(project);

        response.sendRedirect("ProjectServlet?action=getAllProjects");
    }


    private void addProject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectName = request.getParameter("projectName");
        String description = request.getParameter("description");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        double budget = Double.parseDouble(request.getParameter("budget"));

        Project newProject = new Project(projectName, description, startDate, endDate, budget);

        projectDao.create(newProject);

        response.sendRedirect("ProjectServlet?action=getAllProjects");
    }

}
