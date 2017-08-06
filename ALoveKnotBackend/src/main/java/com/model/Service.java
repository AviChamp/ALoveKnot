package com.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="Service")
@Component
public class Service {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    private int sid;
	
    private String servicename;
    private String description;
    private float price;
    private int stock;
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="cid")
    private Category category;
    

	@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="vid")
    private Vendor vendor;

	@Transient
	MultipartFile simage;
	
	private String imgname;

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getServicename() {
		return servicename;
	}

	public void setServicename(String servicename) {
		this.servicename = servicename;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}
    
	public MultipartFile getSimage() {
		return simage;
	}
	
	public void setSimage(MultipartFile simage) {
		this.simage = simage;
	}
	public String getImgname() {
		return imgname;
	}

	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
}