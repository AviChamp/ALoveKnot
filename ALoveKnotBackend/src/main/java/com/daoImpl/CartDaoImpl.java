package com.daoImpl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.CartDao;
import com.dao.CategoryDao;
import com.model.Cart;
import com.model.Service;

@Repository("cartDaoImpl")
public class CartDaoImpl implements CartDao {
	
	@Autowired
    SessionFactory sessionFactory;
	
	public CartDaoImpl(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}


	public void insertService(Cart cart) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.persist(cart);
		session.getTransaction().commit();
	}
	
	@SuppressWarnings("unchecked")
	public List<Cart> findCartByID(String userId){
		Session session =sessionFactory.openSession();
		List<Cart> cr=null;
		try{
			session.beginTransaction();
			cr=(List<Cart>)session.createQuery("from Cart where userMailId=:email").setString("email",userId).list();
			session.getTransaction().commit();
		}catch(HibernateException ex){
			ex.printStackTrace();
			session.getTransaction().rollback();
		}
		return cr;
	}

    public Cart getCartById(int cartId, String userEmail) {
    	Session session =sessionFactory.openSession();
    	Cart cr=null;
    	try {
        	session.beginTransaction();
    	    cr=(Cart) session.createQuery("from Cart where userMailId=:email and cartServiceID=:id").setString("email",userEmail).setInteger("id", cartId).uniqueResult();
    	    session.getTransaction().commit();
    	   }catch(HibernateException ex) {
    		   ex.printStackTrace();
    	       session.getTransaction().rollback();
    	}
    	return cr;
    }
    
    public void deleteCart(int cartId){
    	Session session =sessionFactory.openSession();
    	session.beginTransaction();
    	Cart cr=(Cart)session.get(Cart.class, cartId);
    	session.delete(cr);
    	session.getTransaction().commit();
    }
    
    public void update(Cart cr){
    	Session session =sessionFactory.openSession();
    	session.beginTransaction();
    	session.update(cr);
    	session.getTransaction().commit();
    }
}
