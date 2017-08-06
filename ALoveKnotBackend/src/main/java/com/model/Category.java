package com.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import org.springframework.stereotype.Component;

@Entity
@Table(name="Category")
@Component
public class Category {
   
	@Id
	private int cid;
	private String categoryname;
	@OneToMany(targetEntity=Service.class, fetch=FetchType.EAGER, mappedBy="category")
	private Set<Service> service=new HashSet<Service>(0);
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	public Set<Service> getService() {
		return service;
	}
	public void setService(Set<Service> service) {
		this.service = service;
	}	
}
