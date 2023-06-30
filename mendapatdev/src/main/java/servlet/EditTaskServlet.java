package servlet;

import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import model.TaskModel;
import dao.TaskDAO;

@WebServlet("/taskedit")
public class EditTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TaskDAO taskDAO;

	public void init() {
		taskDAO = new TaskDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int taskid = Integer.parseInt(request.getParameter("taskid"));
		String name = request.getParameter("name");
		String duedate = request.getParameter("duedate");
		String description = request.getParameter("description");
		int statusid = Integer.parseInt(request.getParameter("statusid"));
		int categoryid = Integer.parseInt(request.getParameter("categoryid"));
		int userid = Integer.parseInt(request.getParameter("userid"));

		TaskModel tasks = new TaskModel(taskid, name, duedate, description, statusid, categoryid, userid);
		try {
			taskDAO.updateTask(tasks);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/taskview");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}
