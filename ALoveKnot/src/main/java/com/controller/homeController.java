package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;

import com.daoImpl.CategoryDaoImpl;
import com.daoImpl.ServiceDaoImpl;
import com.daoImpl.UserDaoImpl;
import com.daoImpl.VendorDaoImpl;
import com.model.Service;
import com.model.User;



@Controller
public class homeController {
	
	@Autowired
	UserDaoImpl userDaoImpl;
	
	@Autowired
	CategoryDaoImpl categoryDaoImpl;
	 
	@Autowired
	VendorDaoImpl vendorDaoImpl;
	
	@Autowired
	ServiceDaoImpl serviceDaoImpl;
	
    @RequestMapping("/")
    public String index() {
    	return "index";
    }
    
    @RequestMapping("/index")
    public String home() {
    	return "index";
    }
    
    @RequestMapping(value="/register",method=RequestMethod.GET)
    public ModelAndView showRegister(){
    	ModelAndView mav =new ModelAndView();
        mav.addObject("user",new User());
        mav.setViewName("register");
    	return mav;
                 }
    
    @RequestMapping(value="/saveregister", method=RequestMethod.POST)
    public ModelAndView saveRegister(@Valid @ModelAttribute("user") User user, BindingResult result) {
    	ModelAndView mav =new ModelAndView();
    	if(result.hasErrors()) {
    		mav.setViewName("register");
    	}
    	else {
    		user.setRole("ROLE_USER");
    		user.setEnabled(true);
    		userDaoImpl.insertUser(user);
    		mav.setViewName("redirect:/index");
    	}
    	return mav;
    	
    }
    // gender
    @ModelAttribute("genderList")
    public List populateGenderList() {
        List list = (List) new ArrayList<String>();
        list.add("Male");
        list.add("Female");
        list.add("Others");
        return list;
               }
    //month
    @ModelAttribute("monthList")
    public List populateMonthList() {
        List list = (List) new ArrayList<String>();
        list.add("January");
        list.add("February");
        list.add("March");
        list.add("April");
        list.add("May");
        list.add("June");
        list.add("July");
        list.add("August");
        list.add("September");
        list.add("October");
        list.add("November");
        list.add("December");
        return list;
           }
	 
	 @RequestMapping("/serviceCustList")
	 public ModelAndView serviceCustList(@RequestParam("cid")int cid){
		 System.out.println(cid);
		 ModelAndView mav =new ModelAndView();
		 mav.addObject("serviceList",serviceDaoImpl.getServiceByCID(cid));
		 mav.setViewName("serviceCustList");
		 return mav;
	 }
	 
	 @ModelAttribute
	 public void addAttribute(Model m) {
		 m.addAttribute("catList",categoryDaoImpl.retrieve());
		 m.addAttribute("vendList",vendorDaoImpl.retrieve());
		 m.addAttribute("servList",serviceDaoImpl.retrieve());
	 }
	 
	 @RequestMapping("/login")
	 public ModelAndView login(@RequestParam(value="error", required=false)String error){
		 ModelAndView mav =new ModelAndView("/login");
		 if(error!=null){
			 mav.addObject("message","Invalid Username and Password");
		 }
		 mav.addObject("title","login");
		 return mav;
	 }
	 @RequestMapping("/error")
	 public String errorPage(){
		 return "/error";
	 }
     
	 @RequestMapping("/userLogged")
	 public String userLogged(){
		 return "redirect:/index";
	 }

	 @RequestMapping("/serviceDetail/{sid}")
	 public ModelAndView serviceDetail(@PathVariable("sid")int sid){
		 ModelAndView mav= new ModelAndView("serviceDetail");
		 Service service=serviceDaoImpl.findById(sid);
		 mav.addObject("service",service);
		 return mav;
	 }
	 
	 @RequestMapping("/aboutUs")
	 public String aboutUs(){
		 return "aboutUs";
	 }

	 
}