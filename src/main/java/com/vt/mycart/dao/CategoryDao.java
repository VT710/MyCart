package com.vt.mycart.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.vt.mycart.entities.Category;
import com.vt.mycart.entities.User;

public class CategoryDao {

	private EntityManager manager;

	public CategoryDao(EntityManager manager) {

		this.manager = manager;
	}

	// save category to DB
	public int saveCategory(Category cat) {
		int id = 0;
		try {
			// to track the process of sending data to database
			EntityTransaction transaction = manager.getTransaction();
			// to start transaction
			transaction.begin();
			// for saving there in an inbuilt method in manager
			manager.persist(cat);
			//save to db
			transaction.commit();
		
			int a = cat.getCategoryId();
			if (a != 0) {
				id = a;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	
	
	public List<Category> getListCategory(){
		String query="select c from category c";
		
		Query res = manager.createQuery(query);
		
		List<Category> list= res.getResultList();
		return list;
	}

}
