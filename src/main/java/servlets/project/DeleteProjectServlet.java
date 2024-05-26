package servlets.project;

import dao.ProjectDaoImp;
import model.Project;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteProjectServlet")
public class DeleteProjectServlet extends HttpServlet {
    private ProjectDaoImp projectDao;

    @Override
    public void init() {
        projectDao = new ProjectDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int projectId = Integer.parseInt(request.getParameter("projectId"));
        Project project = projectDao.getProject(projectId);
        if (project != null) {
            projectDao.delete(project);
        }

        response.sendRedirect(request.getContextPath() + "allProjects");
    }
}