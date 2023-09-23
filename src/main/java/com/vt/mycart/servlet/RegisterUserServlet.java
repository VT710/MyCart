package com.vt.mycart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vt.mycart.entities.User;
import com.vt.mycart.helper.EntityManagerProvider;

@WebServlet("/registerUser")
public class RegisterUserServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();

		try {
			String userName = req.getParameter("user_name");
			String userEmail = req.getParameter("user_email");
			String userPassword = req.getParameter("user_password");
			String userPhone = req.getParameter("user_phone");
			String userAddress = req.getParameter("user_address");

			// creating user object to store data
			User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress,"normal");
			
			EntityManager manager=EntityManagerProvider.getManager();
			
			EntityTransaction transaction=manager.getTransaction();
			
			transaction.begin();
			
			manager.persist(user);
			
			transaction.commit();
			
		
			
			HttpSession httpSession =req.getSession();
			httpSession.setAttribute("message", "Registration Successful ! your user_id = "+user.getUserId());
			resp.sendRedirect("register.jsp");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
