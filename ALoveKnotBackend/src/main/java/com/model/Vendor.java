package com.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Component;

@Entity
@Table(name="Vendor")
@Component
public class Vendor {

	@Id
	private int vid;
	private String vendorname;
	@OneToMany(targetEntity=Service.class, fetch=FetchType.EAGER, mappedBy="vendor")
	private Set<Service> service=new HashSet<Service>(0);
	
	public int getVid() {
		return vid;
	}
	public void setVid(int vid) {
		this.vid = vid;
	}
	public String getVendorname() {
		return vendorname;
	}
	public void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}
	public Set<Service> getService() {
		return service;
	}
	public void setService(Set<Service> service) {
		this.service = service;
	}
}
