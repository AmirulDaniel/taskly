package servlet;

import java.sql.SQLException;
import java.util.List;

import dao.TaskDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.TaskModel;
import model.OverdueModel;
import model.OngoingModel;
import model.CompletedModel;

import java.io.IOException;

@WebServlet("/main-menu")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private TaskDAO taskDAO;

	public void init() {
		taskDAO = new TaskDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userCurrent = (String)session.getAttribute("currentUser");
		int userCurrentID = (int)session.getAttribute("currentUserID");
		request.setAttribute("userCurrent", userCurrent);
		if(userCurrent!=null) {
			OverdueModel overdue = taskDAO.countOverdue(userCurrentID);
			request.setAttribute("overdue", overdue);
			OngoingModel ongoing = taskDAO.countOngoing(userCurrentID);
			request.setAttribute("ongoing", ongoing);
			CompletedModel completed = taskDAO.countCompleted(userCurrentID);
			request.setAttribute("completed", completed);
			RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
			dispatcher.forward(request, response);
		}
		else {
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/login-menu");
		}
	}
}
