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

@WebServlet("/main-menu")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userCurrent = (String)session.getAttribute("currentUser");
		request.setAttribute("userCurrent", userCurrent);
		if(userCurrent!=null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
			dispatcher.forward(request, response);
		}
		else {
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/login-menu");
		}
	}
}
