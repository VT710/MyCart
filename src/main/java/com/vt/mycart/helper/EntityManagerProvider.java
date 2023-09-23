package com.vt.mycart.helper;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EntityManagerProvider {

	private static EntityManager manager;
	
	public static EntityManager getManager() {
		
		try {
			if(manager==null) {
				EntityManagerFactory factory = Persistence.createEntityManagerFactory("vikas");
				manager=factory.createEntityManager();
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return manager;
	}
}
