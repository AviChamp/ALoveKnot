package com.daoImpl;


import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.Orders;
import com.model.Service;

@Repository("orderDaoImpl")
public class OrderDaoImpl {
 
	@Autowired
    SessionFactory sessionFactory;
	
	public OrderDaoImpl(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	public void insertService(Orders orders) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.persist(orders);
		session.getTransaction().commit();
	}

}
