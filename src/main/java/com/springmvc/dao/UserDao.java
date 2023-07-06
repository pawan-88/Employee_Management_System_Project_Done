package com.springmvc.dao;

import java.util.List;

import com.springmvc.entity.User;

public interface UserDao {
	
	public int saveUser(User user);
	
	public User loginUser(String email, String password);
	
//	public List<User> getEmpDetailsByEmail(String email);
//	public User getByUserEmail(String email);
	public List<User> getEmpDetailsByEmail();
	
	public List<User> getEmpByEmail(String em);
	public int saveEmp(User user); 
	
	public User getEmployeeById(int id);
	
	public List<User> getAllEmployee();
	
	
	public void updateEmp(User user);
	
	public void deleteEmp(int id);
	
//	public void deleteAddress(int addressId);
	 public void deleteAddress(int addressId);

	public boolean isEmailPresent(String email);
	
	/// Employee Multiple Address
//	void saveEmployee(User user);
//    User getEmployeeById(int id);
//    void updateEmployee(User user);
//    void deleteEmployee(int id);

	
}
