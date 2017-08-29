package com.config;

import java.util.Properties;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.model.*;
import com.daoImpl.*;

@Configuration
@ComponentScan("com")
@EnableTransactionManagement
public class hibernateConfig {
	@Autowired
	@Bean(name="dataSource")
	public DataSource getH2DataSource()
	{
	   System.out.println("Data Source Method");
	   DriverManagerDataSource dataSource = new DriverManagerDataSource();
	   dataSource.setDriverClassName("org.h2.Driver");
	   dataSource.setUrl("jdbc:h2:tcp://localhost/~/test");
	   dataSource.setUsername("sa");
	   dataSource.setPassword("");

	   System.out.println("Data Source Created");
	   return dataSource;
	}
	
	private Properties getHibernateProperties() {
	       Properties properties = new Properties();
	       properties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
	       properties.put("hibernate.hbm2ddl.auto", "update");
	       properties.put("hibernate.show_sql", "true");
	       return properties;
	}

	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) {
	LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
	sessionBuilder.addProperties(getHibernateProperties());
	sessionBuilder.addAnnotatedClass(User.class);
	sessionBuilder.addAnnotatedClass(Category.class);
	sessionBuilder.addAnnotatedClass(Vendor.class);
	sessionBuilder.addAnnotatedClass(Service.class);
	sessionBuilder.addAnnotatedClass(Cart.class);
	sessionBuilder.addAnnotatedClass(Orders.class);
	//sessionBuilder.scanPackages("com.model");
	return sessionBuilder.buildSessionFactory();
	}

	@Autowired
	@Bean(name="userDaoImpl")
	public UserDaoImpl getUserDAO(SessionFactory sessionFactory)
	{
		return new UserDaoImpl(sessionFactory);
	}
    
	@Autowired
	@Bean(name="categoryDaoImpl")
	public CategoryDaoImpl getCategoryDAO(SessionFactory sessionFactory)
	{
		return new CategoryDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name="serviceDaoImpl")
	public ServiceDaoImpl getServiceDAO(SessionFactory sessionFactory)
	{
		return new ServiceDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name="vendorDaoImpl")
	public VendorDaoImpl getVendorDAO(SessionFactory sessionFactory)
	{
		return new VendorDaoImpl(sessionFactory);
	}
	@Autowired
	@Bean(name="cartDaoImpl")
	public CartDaoImpl getCartDAO(SessionFactory sessionFactory)
	{
		return new CartDaoImpl(sessionFactory);
	}
	@Autowired
	@Bean(name="orderDaoImpl")
	public OrderDaoImpl getOrderDAO(SessionFactory sessionFactory)
	{
		return new OrderDaoImpl(sessionFactory);
	}


	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
	HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
	return transactionManager;
	}
}
