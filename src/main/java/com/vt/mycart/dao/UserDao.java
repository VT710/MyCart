package com.vt.mycart.dao;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.vt.mycart.entities.User;

public class UserDao {
	private EntityManager manager;
	
	public UserDao(EntityManager manager)
	{
		this.manager=manager;
	}
	
	
	//get user by email and password
	
	public User getUserByEmaailAndPassword(String email, String password) {
		User user=null;
		
		try {
			String query =  "select u from User u where u.userEmail=:e and u.userPassword=:p";
			
			
			Query res = manager.createQuery(query);
			res.setParameter("e", email);
			res.setParameter("p", password);
			
			user = (User) res.getSingleResult();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return user;
	}

}
