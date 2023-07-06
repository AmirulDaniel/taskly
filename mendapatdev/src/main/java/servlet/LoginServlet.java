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

import model.UserModel;
import dao.UserDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	int existingStaffID = 0;

	public void init() {
		userDAO = new UserDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		try{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			UserModel existingUser = userDAO.selectUsername(username);
			
			if(password.equals(existingUser.getPassword())) {
				//creating a session
				HttpSession session = request.getSession();
				session.setAttribute("currentUser", existingUser.getUsername());
				session.setAttribute("currentUserID", existingUser.getUserid());
				response.sendRedirect(request.getContextPath() + "/main-menu");
			}
		}catch(Exception e){
			response.sendRedirect(request.getContextPath() + "/login-menu");
		}
	}
}
