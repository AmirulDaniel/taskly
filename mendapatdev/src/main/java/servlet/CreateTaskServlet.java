package servlet;

import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import model.TaskModel;
import dao.TaskDAO;

@WebServlet("/taskcreate")
public class CreateTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TaskDAO taskDAO;

	public void init() {
		taskDAO = new TaskDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userid = (int)session.getAttribute("currentUserID");
		String name = request.getParameter("name");
		String duedate = request.getParameter("duedate");
		String description = request.getParameter("description");
		int statusid = Integer.parseInt(request.getParameter("statusid"));
		int categoryid = Integer.parseInt(request.getParameter("categoryid"));
		
		TaskModel newTask = new TaskModel(name, duedate, description, statusid, categoryid, userid);
		try {
			taskDAO.insertTask(newTask);
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