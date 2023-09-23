package com.vt.mycart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vt.mycart.dao.UserDao;
import com.vt.mycart.entities.User;
import com.vt.mycart.helper.EntityManagerProvider;

@WebServlet("/user_login")
public class LoginUserServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		
		
		String email= req.getParameter("email");
		String password = req.getParameter("password");
		
		//validations
		
		//authenticating user
		UserDao dao=new UserDao(EntityManagerProvider.getManager());
		
		User user=dao.getUserByEmaailAndPassword(email, password);
		//out.println(user);
		
		//for message set Session 
		HttpSession httpSession=req.getSession();
		
		
		if(user==null )
		{
			httpSession.setAttribute("message", "Invalid credentials || Try with another one");
			resp.sendRedirect("login.jsp");
			return;
		}else {
			out.println("<h1> Welcome "+user.getUserName()+" </h1>");
			
			//login
			httpSession.setAttribute("current-user", user);
			
			if(user.getUserType().equals("admin")) {
				//admin : admin.jsp
				
				resp.sendRedirect("admin.jsp");
				
			}else if(user.getUserType().equals("normal"))
			{
				//normal : normal.jsp
				resp.sendRedirect("normal.jsp");
			}else {
				out.println("we have not identified user type");
			}
		}
	}

}
