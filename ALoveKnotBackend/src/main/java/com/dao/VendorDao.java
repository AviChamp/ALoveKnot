package com.dao;

import java.util.List;
import com.model.Vendor;

public interface VendorDao {
	
   public void insertVendor(Vendor vendor);
   public List<Vendor> retrieve();
   public Vendor findById(int vid);
}
