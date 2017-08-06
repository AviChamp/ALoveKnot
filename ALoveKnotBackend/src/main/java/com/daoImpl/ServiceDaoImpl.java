package com.daoImpl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.ServiceDao;
import com.model.Service;

@Repository("serviceDaoImpl")
public class ServiceDaoImpl implements ServiceDao {
    
	@Autowired
    SessionFactory sessionFactory;
	
	public ServiceDaoImpl(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}


	public void insertService(Service service) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.persist(service);
		session.getTransaction().commit();
	}
	
	public List<Service> retrieve(){
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Service> list=session.createQuery("from Service").list();
		session.getTransaction().commit();
		return list;
	}
	
	public Service findById(int sid) {
		Session session=sessionFactory.openSession();
		Service s=null;
		try {
			session.beginTransaction();
			s=session.get(Service.class, sid);
			session.getTransaction().commit();
		}catch(HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return s;
	}

}
