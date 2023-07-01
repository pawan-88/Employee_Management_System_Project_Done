package com.springmvc.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "user_table")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "user_id")
	private int id;

	private String fullName;

	private String contactNumber;

	private String email;

	private String password;

	private String department;

//	@OneToMany(targetEntity = Address.class,cascade = CascadeType.ALL)
//	@JoinColumn(name = "emp",referencedColumnName = "id")
	@OneToMany(mappedBy = "user",fetch = FetchType.EAGER ,cascade = CascadeType.ALL)
	private List<Address> address;
 
	public int getId() {
		return id;
	}

	public List<Address> getAddress() {
		return address;
	}

	public void setAddress(List<Address> address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", fullName=" + fullName + ", contactNumber=" + contactNumber + ", email=" + email
				+ ", password=" + password + ", department=" + department + ", address=" + address + ", userType="
				+ userType + "]";
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	private String userType;

}
