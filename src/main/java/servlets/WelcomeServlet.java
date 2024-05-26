package servlets;

import dao.ProjectDaoImp;
import model.Project;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "WelcomeServlet", urlPatterns = {"/welcome"})
public class WelcomeServlet extends HttpServlet {
    private ProjectDaoImp projectDao;

    @Override
    public void init() {
        projectDao = new ProjectDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Project> projects = projectDao.getAllLimit();
        request.setAttribute("projects", projects);
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }
}
