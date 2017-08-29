package com.ALoveKnotBackend;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.daoImpl.VendorDaoImpl;
import com.model.Vendor;

import junit.framework.TestCase;

public class CheckVendDao{
	 @Autowired
     static AnnotationConfigApplicationContext context;
	 static VendorDaoImpl vendorDaoImpl;
	  
	  @BeforeClass
	  public static void initialize(){
		  context=new AnnotationConfigApplicationContext();
		  context.scan("com");
		  context.refresh();
		  vendorDaoImpl=(VendorDaoImpl)context.getBean("vendorDaoImpl");      
	  }
	  
	  @Test
	  public void vendTestCase(){
		  Vendor v =new Vendor();
		  v.setVid(2556);
		  v.setVendorname("Adesh photographer");
		  vendorDaoImpl.insertVendor(v);
		  assertEquals(2556,v.getVid());
	  }
}
