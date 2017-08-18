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
import org.springframework.web.multipart.MultipartFile;

import com.daoImpl.CartDaoImpl;
import com.daoImpl.CategoryDaoImpl;
import com.daoImpl.OrderDaoImpl;
import com.daoImpl.ServiceDaoImpl;
import com.daoImpl.UserDaoImpl;
import com.daoImpl.VendorDaoImpl;
import com.model.Cart;
import com.model.Category;
import com.model.Orders;
import com.model.Service;
import com.model.User;
import com.model.Vendor;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.ModelMap;

@RequestMapping("/cart")
@Controller
public class cartController {
	@Autowired
	UserDaoImpl userDaoImpl;
	
	@Autowired
	CategoryDaoImpl categoryDaoImpl;

	@Autowired
	VendorDaoImpl vendorDaoImpl;

	@Autowired
	ServiceDaoImpl serviceDaoImpl;

	@Autowired
	CartDaoImpl cartDaoImpl;

	@Autowired
	OrderDaoImpl orderDaoImpl;

	@RequestMapping(value="/addToCart", method=RequestMethod.POST)
     public ModelAndView addToCart(HttpServletRequest req){
		 ModelAndView mav=new ModelAndView();
		 try{
			 Principal principal =req.getUserPrincipal();
			 String userEmail=principal.getName();
			 int sid=Integer.parseInt(req.getParameter("sid"));		 
			 Double cartPrice=Double.parseDouble(req.getParameter("price"));
			 int cartQuantity=Integer.parseInt(req.getParameter("cartQuantity"));
		     String servicename=req.getParameter("servicename");
		     String imgname=req.getParameter("imgname");
		     Cart exists=(Cart) cartDaoImpl.getCartById(sid,userEmail);
		     if(exists==null){
		    	 Cart cr=new Cart();
		    	 cr.setCartPrice(cartPrice);
		    	 cr.setCartServiceID(sid);
		    	 cr.setCartServiceName(servicename);
		    	 cr.setCartImage(imgname);
		    	 cr.setCartQuantity(cartQuantity);
		    	 User u=userDaoImpl.findById(userEmail);
		    	 cr.setCartUserDetails(u);
		    	 cartDaoImpl.insertService(cr);
		     }
		     else if(exists!=null){
		    	 Cart cr=new Cart();
		    	 cr.setCartPrice(cartPrice);
		    	 cr.setCartServiceID(sid);
		    	 cr.setCartServiceName(servicename);
		    	 cr.setCartImage(imgname);
		    	 cr.setCartQuantity(cartQuantity);
		    	 User u=userDaoImpl.findById(userEmail);
		    	 cr.setCartUserDetails(u);
		    	 cartDaoImpl.update(cr);
		     }
		    mav.addObject("cartInfo",cartDaoImpl.findCartByID(userEmail));
		    mav.setViewName("cart");
		    return mav;
		 }catch(Exception e){
			 mav.setViewName("login");
			 return mav;			 
		 }
	 }
   
	@RequestMapping(value="/invoiceprocess", method=RequestMethod.POST)
    public ModelAndView orderSave(HttpServletRequest req){
		 ModelAndView mav=new ModelAndView("invoice");
	     Orders ord=new Orders();
	     Principal principal =req.getUserPrincipal();
		 String userEmail=principal.getName();
		 Double total=Double.parseDouble(req.getParameter("total"));
		 String payment=req.getParameter("payment");
		 User u=userDaoImpl.findById(userEmail);
		 ord.setUser(u);
		 ord.setTotal(total);
		 ord.setPayment(payment);
		 orderDaoImpl.insertService(ord);
	     mav.addObject("orderDetails", u);
	     return mav;
	}
	
	@RequestMapping(value="/checkout",method=RequestMethod.POST)
	 public ModelAndView checkoutProcess(HttpServletRequest req){
		 ModelAndView mav=new ModelAndView("checkout");
	     Principal principal =req.getUserPrincipal();
		 String userEmail=principal.getName();
		 User user=userDaoImpl.findById(userEmail);
		 List<Cart> cart=cartDaoImpl.findCartByID(userEmail);
		 mav.addObject("user",user);
		 mav.addObject("cart",cart);
		 return mav;
	}
	
	@RequestMapping(value="/deleteCart/{cartId}")
	public ModelAndView deleteCartItem(@PathVariable("cartId")int cartId, HttpServletRequest req){
		 ModelAndView mav=new ModelAndView();
	     Principal principal =req.getUserPrincipal();
		 String userEmail=principal.getName();
	     cartDaoImpl.deleteCart(cartId);
	     mav.addObject("cartInfo",cartDaoImpl.findCartByID(userEmail));
	     mav.setViewName("cart");
	     return mav;
	}
	
}
