package com.springmvc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.entity.Address;
import com.springmvc.entity.User;

@Transactional
//@Repository("userDaoImpl")
@Service
public class UserDaoImpl implements UserDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public int saveUser(User user) {
		for (Address address : user.getAddress()) {
			address.setUser(user);
//			System.out.println(user);
		}
		int i = (int) hibernateTemplate.save(user);
		return i;
	}

//	public User loginUser(String email, String password) {
//	    String query = "from User where email=:em and password=:pwd";
//	    HibernateCallback<User> callback = new HibernateCallback<User>() {
//	        @Override
//	        public User doInHibernate(Session session) throws HibernateException {
//	            Query<User> q = session.createQuery(query, User.class);
//	            q.setParameter("em", email);
//	            q.setParameter("pwd", password);
//	            return q.uniqueResult();
//	        }
//	    };
//	    return hibernateTemplate.execute(callback);
//	}
//	@SuppressWarnings("deprecation")
//	public User loginUser(String email, String password) {
//		final String query = "from User where email=:em and password:pwd";
//		User us =(User) hibernateTemplate.execute(s->{
//			Query q = s.createQuery(query);
//			q.setString("em", email);
//			q.setString("pwd", password);
//			return q.uniqueResult();
//		}); 
//		return us;
//	

//	public User loginUser(String email, String password) {
//	    String sql = "from User where email=:email";
//	    User user = null;
//
//	    Session session = hibernateTemplate.getSessionFactory().openSession();
//	    try {
//	        Query query = session.createQuery(sql);
//	        query.setParameter("em", email);
//	        query.setParameter("pwd", password);
//	        user = (User) query.uniqueResult();
//	        
//	        System.out.println("Generated SQL: " + query.getQueryString());
//	        System.out.println("Email parameter: " + email);
//	        System.out.println("Password parameter: " + password);
//
//	        if (user != null) {
//	            String DBPassword = user.getPassword();
//	            System.out.println("DBPassword: " + DBPassword);
//
//	            if (bCryptPasswordEncoder.matches(password, DBPassword)) {
//	                System.out.println("User: " + user);
//	                System.out.println("Password: " + password);
//	                return user;
//	            } else {
//	                return null; // or handle incorrect password case
//	            }
//	        } else {
//	            return null; // or handle user not found case
//	        }
//	    } finally {
//	        session.close();
//	    }
//	}
	// -----------------------------------------------------------------------//
	public User loginUser(String email, String password) {
		String sql = "from User where email=:em";
		User user = null;

		Session session = hibernateTemplate.getSessionFactory().openSession();
		try {
			Query query = session.createQuery(sql);
			query.setString("em", email);
			user = (User) query.uniqueResult();

			if (user != null) {
				String DBPassword = user.getPassword();
//	            System.out.println("LoginPass: "+password);
//	            System.out.println("DBPassword: " + DBPassword);

				if (bCryptPasswordEncoder.matches(password, DBPassword)) {
					System.out.println("LoginPass: " + password);
					System.out.println("DBPassword: " + DBPassword);
					return user;
				}
			}
		} finally {
			session.close();
		}
		return user;
	}

	// ----------------------------------------------------------------------//
//	public User loginUser(String email, String password) {
//	    String sql = "from User where email=:em";
//	    User user = null;
//	    
//	    Session session = hibernateTemplate.getSessionFactory().openSession();
//	    try {
//	        Query query = session.createQuery(sql);
//	        query.setString("em", email);
////	        query.setString("pwd", password);
//	        user = (User) query.uniqueResult();
////	        System.out.println("User Query: "+query);
//	        
//	        if (user != null) {
//	        	System.out.println("Login UserPass: "+user.getPassword());
//	            String loginPass=bCryptPasswordEncoder.encode(user.getPassword());
//	            user.setPassword(loginPass);
////	            System.out.println("loginPas: "+loginPass);
//	            String DBPassword = user.getPassword();
//	            System.out.println("DBPassword: " + DBPassword);
////	            System.out.println("User: " + user);
////	            System.out.println("Password: " + password);
//
//	            if (loginPass.equals(DBPassword)) {
//	                return user;
//	            } else {
//	                return null; // or handle incorrect password case
//	            }
//	        } else {
//	            return null; // or handle user not found case
//	        }
//	    } finally {
//	        session.close();
//	    }
//	}

//	 public User loginUser(String email, String password) {
//
//	        String sql = "from User where email=:em and password=:pwd";
//
//	        User user = null;
//	        Session session = hibernateTemplate.getSessionFactory().openSession();
//	        try {
//	         Query query = session.createQuery(sql);
//
//	            query.setString("em", email);
//
//	            query.setString("pwd", password);
//
//	            user = (User) query.uniqueResult();
//	            System.out.println("User: "+user);
//	            String DBPassword = user.getPassword();
//	            System.out.println("DBPassword: "+DBPassword);
//	            
//	            String loginPass = bCryptPasswordEncoder.encode(password);
//	            System.out.println("User: "+user);
//	            System.out.println("Password: "+password);     
//	          if(bCryptPasswordEncoder.matches(loginPass, DBPassword)) {
//	                
//	            	return user;
//	            	
//	            }else {
//	            	return null;
//	            }
//	        } finally {
//	            session.close();
//	        }
//	}

//	@SuppressWarnings("unchecked")
//	public List<User> getEmpDetailsByEmail(String email) {
//		// TODO Auto-generated method stub
//		String hql = "FROM User where email = :email";
//		Query<User> query = (Query<User>) hibernateTemplate.getSessionFactory();
//		List <User> usr = query.getResultList();
//		System.out.println(usr);
//		return null;
//	}

	@Transactional
	public List<User> getEmpDetailsByEmail() {
//		User user = new User();
		List<User> list = hibernateTemplate.loadAll(User.class);

		return list;

	}

	public List<User> getEmpByEmail(String em) {
		String hql = "FROM User where email=:em";
		Query<User> query = hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql, User.class);
		query.setParameter("em", em);
		List<User> list = query.list();
		return list;
	}

//	@Transactional
//	public int saveEmp(User user) {
//	    try {
//	        for (Address address : user.getAddress()) {
//	            address.setUser(user);
//	            System.out.println(address);
//	        }
//	        hibernateTemplate.saveOrUpdate(user);
//	        return 1;
//	    } catch (Exception e) {
//	        // Handle any exceptions or log the error
//	        e.printStackTrace();
//	        return 0;
//	    }
//	}

	/// Sve emp for multiple address
	@Transactional
	public int saveEmp(User user) {
		for (Address address : user.getAddress()) {
			address.setUser(user);
//			System.out.println(user);
		}
		int i = (Integer) hibernateTemplate.save(user);
		System.out.println(i);
		return i;

	}

	public User getEmployeeById(int id) {

		User user = hibernateTemplate.get(User.class, id);
		return user;
	}

	public List<User> getAllEmployee() {
		List<User> users = hibernateTemplate.loadAll(User.class);
		return users;
	}

	@Transactional
	public void updateEmp(User user) {

		hibernateTemplate.update(user);

	}

	@Transactional
	public void deleteEmp(int id) {

		User user = hibernateTemplate.get(User.class, id);

		hibernateTemplate.delete(user);
	}

//	@Transactional
//	@Override
//	public void deleteAddress(int addressId) {
//		Address address= hibernateTemplate.get(Address.class, addressId);
//		
//		if(address != null) {
//			User user = address.getUser();
//			user.getAddress().remove(address);
//			hibernateTemplate.delete(address);
//			hibernateTemplate.saveOrUpdate(user);
//		}
//	}
	@Transactional
	public void deleteAddress(int addressId) {
		Address address = hibernateTemplate.get(Address.class, addressId);
		User user = address.getUser();
		user.getAddress().remove(address);

		hibernateTemplate.delete(address);

	}
	
	@Transactional
	public boolean isEmailPresent(String email) {
        Session session = sessionFactory.getCurrentSession();
        Query<User> query = session.createQuery("FROM User WHERE email = :email", User.class);
        query.setParameter("email", email);
        return query.uniqueResult() != null;
    }
	//	@Transactional
//	public User deleteAddress(int addressId) {
//		
//		Address address = hibernateTemplate.get(Address.class, addressId);
//
//		hibernateTemplate.delete(address);
//		return null;
//	@Transactional
////    @Override
//    public Address getAddressById(int addressId) {
//        return hibernateTemplate.get(Address.class, addressId);
//    }

	

}
