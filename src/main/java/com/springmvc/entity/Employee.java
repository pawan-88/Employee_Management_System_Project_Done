//package com.springmvc.entity;
//
//
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.Table;
//
//@Entity
//@Table(name = "emp_Table")
//public class Employee {
//	
//
//	@Id
//	@GeneratedValue(strategy = GenerationType.AUTO)
//	private int id;
//	private String fullName;
//	private String email;
//	private String password;
//	private String department;
//	
////	@OneToMany(targetEntity = Address.class,cascade = CascadeType.ALL)
////	@JoinColumn(name = "emp_k",referencedColumnName = "id")
////	private List<Address> address;
//
//	public int getId() {
//		return id;
//	}
//	public void setId(int id) {
//		this.id = id;
//	}
//	public String getFullName() {
//		return fullName;
//	}
//	public void setFullName(String fullName) {
//		this.fullName = fullName;
//	}
//
//	public String getEmail() {
//		return email;
//	}
//	public void setEmail(String email) {
//		this.email = email;
//	}
//
//
//	public String getPassword() {
//		return password;
//	}
//	public void setPassword(String password) {
//		this.password = password;
//	}
//	public String getDepartment() {
//		return department;
//	}
//	public void setDepartment(String department) {
//		this.department = department;
//	}
//	@Override
//	public String toString() {
//		return "Employee [id=" + id + ", fullName=" + fullName + ", email=" + email + ", password=" + password
//				+ ", department=" + department +  "]";
//	}
//}
//	
