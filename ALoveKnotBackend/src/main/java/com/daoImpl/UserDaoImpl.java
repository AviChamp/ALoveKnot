package com.daoImpl;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.UserDao;
import com.model.Category;
import com.model.User;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao {
       
	@Autowired
    SessionFactory sessionFactory;
	
	public UserDaoImpl(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	public void insertUser(User user) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(user);
		session.getTransaction().commit();
	}
	
	public User findById(String email) {
		Session session=sessionFactory.openSession();
		User u=null;
		try {
			session.beginTransaction();
			u=session.get(User.class, email);
			session.getTransaction().commit();
		}catch(HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return u;
	}
}
