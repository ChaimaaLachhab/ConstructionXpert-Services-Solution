package servlets.project;

import com.fasterxml.jackson.databind.ObjectMapper;
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
import java.util.Map;

@WebServlet("/AddProjectServlet")
public class AddProjectServlet extends HttpServlet {
    private ProjectDaoImp projectDao;
    private ObjectMapper objectMapper = new ObjectMapper();

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
        Map<String, String> jsonMap = objectMapper.readValue(request.getInputStream(), Map.class);

        String projectName = jsonMap.get("projectName");
        String projectImg = jsonMap.get("projectImg");
        String description = jsonMap.get("description");
        Date startDate = Date.valueOf(jsonMap.get("startDate"));
        Date endDate = Date.valueOf(jsonMap.get("endDate"));
        double budget = Double.parseDouble(jsonMap.get("budget"));
        String type = jsonMap.get("projectType");
        ProjectType projectType = ProjectType.valueOf(type);

        Project newProject = new Project(projectName, projectImg, description, startDate, endDate, budget, projectType);

        projectDao.create(newProject);

        response.sendRedirect(request.getContextPath() + "/allProjects");
    }
}
