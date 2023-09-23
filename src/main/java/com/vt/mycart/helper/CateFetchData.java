package com.vt.mycart.helper;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.vt.mycart.dao.CategoryDao;
import com.vt.mycart.entities.Category;

public class CateFetchData {
	
	public static void main(String[] args) {
		
		EntityManager manager = EntityManagerProvider.getManager();
		CategoryDao cdao=new CategoryDao(manager);
		String query="select c from category c";
		
		
		
		Query res = manager.createQuery(query);
		
		List<Category> list=res.getResultList();
		for(Category cat :list)
		{
			System.out.println(cat);
		}
		
		
	}
}
