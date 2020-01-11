package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Account;
import main.Database;

@WebServlet({"/Register"})
public class Register extends HttpServlet {

	// Display the register page
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);

		// Stop if the account is currently logged in
		if (session.getAttribute("account") != null) {
			request.getRequestDispatcher("welcome.jsp").forward(request, response);
			return;
		}

		request.getRequestDispatcher("registration.jsp").forward(request, response);
	}

	// Handle the registration processing
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Get all entered fields
		Account account = new Account();
		account.setUsername(request.getParameter("username_field"));
		account.setPassword(request.getParameter("password_field"));
		account.setFirstName(request.getParameter("first_name_field"));
		account.setLastName(request.getParameter("last_name_field"));

		Database db = Database.getInstance();

		
		// If all else valid then create the account
		db.addAccount(account);
//		request.setAttribute("message", "Account created.");
		doGet(request, response);
		

		String username = request.getParameter("username_field");
		String password = request.getParameter("password_field");
		
		if (account.getPassword().equals(username)) {
//			request.setAttribute("message", "Invalid username and/or password.");
			request.getRequestDispatcher("welcome.jsp").forward(request, response);
			return;
		}
		
		
		
		
	}
}
