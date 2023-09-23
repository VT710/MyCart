package com.vt.mycart.servlet;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vt.mycart.dao.CategoryDao;
import com.vt.mycart.entities.Category;
import com.vt.mycart.helper.EntityManagerProvider;

@WebServlet("/ProductOperationServlet")
public class ProductOperationServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//fetching category data
		String operation=req.getParameter("operation");
		String title=req.getParameter("categoryTitile");
		String desc=req.getParameter("categoryDesc");
		
		if(operation.trim().equals("addcategory")) {
			
			
			//add category
			
			Category category=new Category();
			category.setCategoryTitle(title);
			category.setCategoryDescription(desc);
			
			//category save to DB
			
			CategoryDao dao=new CategoryDao(EntityManagerProvider.getManager());
			
			int catId=dao.saveCategory(category);
			{
				if(catId!=0)
				{
					HttpSession httpSession=req.getSession();
					httpSession.setAttribute("message", category.getCategoryTitle()+" Added Successfully.");
					resp.sendRedirect("admin.jsp");
					return;
					
				}else {
					System.out.println("Not saved");
					
				}
			}
			
		}else if(operation.trim().equals("addproduct")){
			
			//add product
			
			
		}
		
		
		
		
		
		
		
		
		
	}
}
