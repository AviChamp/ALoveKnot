package com.daoImpl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.VendorDao;
import com.model.Vendor;

@Repository("vendorDaoImpl")
public class VendorDaoImpl implements VendorDao{
	@Autowired
    SessionFactory sessionFactory;
	
	public VendorDaoImpl(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	public void insertVendor(Vendor vendor) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(vendor);
		session.getTransaction().commit();		
	}
	
	public List<Vendor> retrieve(){
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Vendor> list=session.createQuery("from Vendor").list();
		session.getTransaction().commit();
		return list;
	}
	
	public Vendor findById(int vid) {
		Session session=sessionFactory.openSession();
		Vendor v=null;
		try {
			session.beginTransaction();
			v=session.get(Vendor.class, vid);
			session.getTransaction().commit();
		}catch(HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return v;
	}
}
