package com.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "CartDetails")
@Component
public class Cart implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int cartId;

	private int cartServiceID;
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userMailId")
	private User cartUserDetails;

	private double cartPrice;
	private int cartQuantity;
	private String cartImage;
	private String cartServiceName;

	public Cart(int cartId, int cartServiceID, User cartUserDetails, double cartPrice, int cartQuantity) {
		super();
		this.cartId = cartId;
		this.cartServiceID = cartServiceID;
		this.cartUserDetails = cartUserDetails;
		this.cartPrice = cartPrice;
		this.cartQuantity = cartQuantity;
	}
	

	public Cart() {
		super();
	}


	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getCartServiceID() {
		return cartServiceID;
	}

	public void setCartServiceID(int cartServiceID) {
		this.cartServiceID = cartServiceID;
	}

	public User getCartUserDetails() {
		return cartUserDetails;
	}

	public void setCartUserDetails(User cartUserDetails) {
		this.cartUserDetails = cartUserDetails;
	}

	public double getCartPrice() {
		return cartPrice;
	}

	public void setCartPrice(double cartPrice) {
		this.cartPrice = cartPrice;
	}

	public int getCartQuantity() {
		return cartQuantity;
	}

	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}

	public String getCartImage() {
		return cartImage;
	}

	public void setCartImage(String cartImage) {
		this.cartImage = cartImage;
	}

	public String getCartServiceName() {
		return cartServiceName;
	}

	public void setCartServiceName(String cartServiceName) {
		this.cartServiceName = cartServiceName;
	}
   
	
}
