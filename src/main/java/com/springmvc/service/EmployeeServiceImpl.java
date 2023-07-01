//package com.springmvc.service;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.springmvc.dao.EmployeeDao;
//import com.springmvc.entity.Employee;
//
//@Service
//public class EmployeeServiceImpl implements EmployeeService {
//	
//	@Autowired
//	private EmployeeDao employeeDao;
//
//	@Override
//	public void saveEmployee(Employee employee) {
//		employeeDao.save(employee);
//		
//	}
//
//	@Override
//	public List<Employee> getEmployeeById(int id) {
//		return (List<Employee>) employeeDao.getById(id);
//	}
//
//	@Override
//	public void updateEmployee(Employee employee) {
//		employeeDao.update(employee);
//	}
//
//	@Override
//	public void deleteEmployee(int id) {
//		Employee employee = employeeDao.getById(id);
//		if(employee != null) {
//			employeeDao.delete(employee);
//		}
//		
//	}
//
//	@Override
//	public int saveEmp(Employee employee) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//}
