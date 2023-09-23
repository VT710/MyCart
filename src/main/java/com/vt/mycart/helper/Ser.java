package com.vt.mycart.helper;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.vt.mycart.entities.User;


public class Ser {

	//get user by email and password
	
	
		public void getUser(String email, String password) {
			EntityManagerFactory factory = Persistence.createEntityManagerFactory("vikas");
			EntityManager manager= factory.createEntityManager();
		try {
			//String query = "from User  where userEmail=: e and userPassword=: p ";
			String q= "select u from User u where u.userEmail=:e and u.userPassword=:p";
			
			Query res = manager.createQuery(q);
			res.setParameter("e", email);
			res.setParameter("p", password);
			
			User p = (User) res.getSingleResult();
			System.out.println(p);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		}
	
	
	public static void main(String[] args) {
		Ser dao=new Ser();
		dao.getUser("kailash@gmail.com", "123");
		
		
		
	}

}
