package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;

import com.daoImpl.CategoryDaoImpl;
import com.daoImpl.ServiceDaoImpl;
import com.daoImpl.VendorDaoImpl;
import com.model.Category;
import com.model.Service;
import com.model.User;
import com.model.Vendor;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;

@Controller
public class adminController {
	
	 @Autowired
	 CategoryDaoImpl categoryDaoImpl;
	 
	 @Autowired
	 VendorDaoImpl vendorDaoImpl;
	
	 @Autowired
	 ServiceDaoImpl serviceDaoImpl;
	 
	 @RequestMapping("/insert")
		 public String insertPage(){
			 return "insert";
		}
//     @RequestMapping(value="/insert",method=RequestMethod.GET)
//	    public ModelAndView showInsert(){
//	    	ModelAndView mav =new ModelAndView();
//	        mav.addObject("c",new Category());
//	        mav.setViewName("insert");
//	    	return mav;
//	                 }
	 @RequestMapping(value="/saveCat", method=RequestMethod.POST)
	 @Transactional
	 public ModelAndView saveCategory(@RequestParam("cid") int cid, @RequestParam("categoryname") String categoryname) {
		 ModelAndView mav =new ModelAndView();
		 Category c=new Category(); 
		 c.setCid(cid);
		 c.setCategoryname(categoryname);
		 categoryDaoImpl.insertCategory(c);
		 mav.setViewName("index");
		 return mav;
	 }

	 @RequestMapping(value="/saveVend", method=RequestMethod.POST)
	 @Transactional
	 public ModelAndView saveVendor(@RequestParam("vid") int vid, @RequestParam("vendorname") String vendorname) {
		 ModelAndView mav =new ModelAndView();
		 Vendor v= new Vendor();
		 v.setVid(vid);
		 v.setVendorname(vendorname);
		 vendorDaoImpl.insertVendor(v);
		 mav.setViewName("index");
		 return mav;
	 }
	 
	 @ModelAttribute
	 public void addAttribute(Model m) {
		 m.addAttribute("catList",categoryDaoImpl.retrieve());
		 m.addAttribute("vendList",vendorDaoImpl.retrieve());
		 m.addAttribute("servList",serviceDaoImpl.retrieve());
	 }
    
	 @RequestMapping(value="/saveServ", method=RequestMethod.POST)
	 public String saveProduct(HttpServletRequest request,@RequestParam("simage") MultipartFile file){
		 Service serv=new Service();
		 serv.setServicename(request.getParameter("servicename"));
		 serv.setPrice(Float.parseFloat(request.getParameter("price")));
		 serv.setStock(Integer.parseInt(request.getParameter("stock")));
		 serv.setDescription(request.getParameter("description"));
		 serv.setCategory(categoryDaoImpl.findById(Integer.parseInt(request.getParameter("category"))));
		 serv.setVendor(vendorDaoImpl.findById(Integer.parseInt(request.getParameter("vendor"))));
		 
		 String filepath=request.getSession().getServletContext().getRealPath("/");
		 String filename=file.getOriginalFilename();
		 serv.setImgname(filename);
		 serviceDaoImpl.insertService(serv);
		 filepath=filepath+"resources"+(char)92+filename;
		 System.out.println("File path File: "+filepath);
		 try {
			 byte imagebyte[]=file.getBytes();
			 BufferedOutputStream fos=new BufferedOutputStream(new FileOutputStream(filepath));
			 fos.write(imagebyte);
			 fos.close();
		 }catch(IOException e){
			 e.printStackTrace();
		 }catch(Exception e){
			 e.printStackTrace();
		 }		 
		 return "index";
	 }
}
