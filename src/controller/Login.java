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

@WebServlet({"/Login"})
public class Login extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);

		if (session.getAttribute("account") != null) {
			request.getRequestDispatcher("welcome.jsp").forward(request, response);
			return;
		}

		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username_field");
		String password = request.getParameter("password_field");

		Database db = Database.getInstance();
		Account account = db.getAccount(username);

		if (account == null || !account.getPassword().equals(password)) {
			request.getRequestDispatcher("registration.jsp").forward(request, response);
			return;
		}

		HttpSession session = request.getSession(true);
		session.setAttribute("account", account);
		doGet(request, response);
	}

}
