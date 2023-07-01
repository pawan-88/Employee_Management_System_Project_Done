//package com.springmvc.dao;
//
//import java.util.List;
//import javax.transaction.Transactional;
//
//import org.hibernate.SessionFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
//import org.springframework.orm.hibernate5.HibernateTemplate;
//import org.springframework.stereotype.Repository;
//
//import com.springmvc.entity.Employee;
//
//@Transactional
//@Repository("employeeDaoImpl")
//
//public class EmployeeDaoImpl implements EmployeeDao {
//
//	@Autowired
//	private HibernateTemplate hibernateTemplate;
//
//	@Autowired
//	private SessionFactory sessionFactory;
//
//	@Transactional
//	public int saveEmp(Employee emp) {
//
//		int i = (Integer) hibernateTemplate.save(emp);
//
//		return i;
//	}
//
//	public Employee getEmployeeById(int id) {
//
//		Employee employee = hibernateTemplate.get(Employee.class, id);
//		return employee;
//	}
//
//	public List<Employee> getAllEmployee() {
//
//		List<Employee> employees = hibernateTemplate.loadAll(Employee.class);
//		return employees;
//	}
//
//	@Transactional
//	public void updateEmp(Employee employee) {
//
//		hibernateTemplate.update(employee);
//
//	}
//
//	@Transactional
//	public void deleteEmp(int id) {
//
//		Employee employee = hibernateTemplate.get(Employee.class, id);
//		hibernateTemplate.delete(employee);
//	}
//
//
//
//
//
//}
