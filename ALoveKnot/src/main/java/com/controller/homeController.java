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

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;


import com.daoImpl.UserDaoImpl;
import com.model.User;



@Controller
public class homeController {
    @RequestMapping("/")
    public String index() {
    	return "index";
    }
    
    @RequestMapping("/index")
    public String home() {
    	return "index";
    }
    @Autowired
    UserDaoImpl userDaoImpl;
    
    @RequestMapping(value="/register",method=RequestMethod.GET)
    public ModelAndView showRegister(){
    	ModelAndView mav =new ModelAndView();
        mav.addObject("user",new User());
        mav.setViewName("register");
    	return mav;
                 }
    
    @RequestMapping(value="/saveregister", method=RequestMethod.POST)
    public ModelAndView saveRegister(@ModelAttribute("user") User user, BindingResult result) {
    	ModelAndView mav =new ModelAndView();
    	if(result.hasErrors()) {
    		mav.setViewName("register");
    	}
    	else {
    		user.setRole("ROLE_USER");
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
}