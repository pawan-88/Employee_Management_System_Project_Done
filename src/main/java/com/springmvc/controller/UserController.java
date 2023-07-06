
package com.springmvc.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.Session;
import com.springmvc.dao.UserDao;
import com.springmvc.entity.Address;
import com.springmvc.entity.User;

@Controller
//@RequestMapping("/employee")
public class UserController {

	@Autowired
	private UserDao userDao;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	@RequestMapping("/contact")
	public String contact() {
		return "contact";
	}
	@RequestMapping("/service")
	public String service() {
		return "service";
	}
	
	@RequestMapping("/about")
	public String about() {
		return "about";
	}

	@RequestMapping("/viewEmployee")
	public String viewEmployee() {
		return "view";
	}
	
	@RequestMapping("/userViewEmployee")
	public String userViewEmployee() {
		return "userView";
	}

	@RequestMapping("/deleteAddress")
	public String deleteAddress() {
		return "empDetails";
	}

	@RequestMapping("/updateEmployee")
	public String updateEmployee() {
		return "empDetails";
	}

	@RequestMapping("/empDetails")
	public String empDetails() {
		return "empDetails";
	}

	@RequestMapping("/forgotPassword")
	public String forgotPassword() {
		return "forgotPassword";
	}

	@RequestMapping("/userAddress")
	public String userAddress() {
		return "address";
	}

	@RequestMapping("/enterOtp")
	public String enterOtp() {
		return "enterOtp";
	}

	@RequestMapping("/resetSuccess")
	public String resetSuccess() {
		return "resetSuccess";
	}

	@RequestMapping("/newPassword-Set")
	public String newPassword() {
		return "newPassword";
	}

	@RequestMapping("/newPassword-Get")
	public String newPasswords() {
		return "login";
	}

	@RequestMapping("/index")
	public String indexPage() {
		return "index";
	}

	@RequestMapping("/admin")
	public String admin() {
		return "admin";
	}
	
	@RequestMapping("/profile")
	public String profile() {
		
		return "profile";
	}

	@RequestMapping("/register")
	public String signup() {
		return "register";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

//	@RequestMapping(name ="/createUser", method= RequestMethod.POST)
	@PostMapping("/createUser")
	public ModelAndView registerUser(@RequestParam("email") String email, @ModelAttribute User user,
			HttpSession session) {

		String password = user.getPassword();
		user.setPassword(bCryptPasswordEncoder.encode(password));
		System.out.println("Register Pass: "+password);
		System.out.println(bCryptPasswordEncoder.matches(password, user.getPassword()));
//		System.out.println(bCryptPasswordEncoder.matches();
		boolean isPresent = userDao.isEmailPresent(email);
		if (isPresent) {
			ModelAndView mv = new ModelAndView();
			mv.addObject("msg", "<span style='color: red; font-weight: bold;'>Email already exists !!</span>");
			mv.addObject("emailErrors", Collections.singletonMap("emailError",
					"<span style='color: red; font-weight: bold;'>Email already exists !!"));
			mv.addObject("msgColor", "red"); // Add the message color
			mv.setViewName("register");
			session.invalidate();
			return mv;
		} else if (password.length() < 8 || password.length() > 15) {
			ModelAndView mv = new ModelAndView();
//	        mv.addObject("msg", "<span style='color: red; font-weight: bold;'>Password should be between 8 to 15 characters !!</span>");
			mv.addObject("errors", Collections.singletonMap("password",
					"<span style='color: red; font-weight: bold;'>Password must be at least 10 characters long"));
			mv.addObject("msgColor", "red"); // Add the message color
			mv.setViewName("register");
			return mv;
		} else {
//			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
			System.out.println("Register: "+user.getPassword());
			userDao.saveUser(user);
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("msg",
					"<span style='color: green; font-weight: bold;'>User Registered Successfully !!</span>");
			mv.addObject("msgColor", "green"); // Add the message color
			mv.setViewName("register");
			session.invalidate();
			return mv;	
		}

	}
	


////	@RequestMapping(path = "/userlogin", method = RequestMethod.POST)
//	@PostMapping("/userLogin")
//	public String login(@RequestParam("email") String em, @RequestParam("password") String pwd, HttpSession session) {
//
//		User user = new User();
//
//		user = userDao.loginUser(em, pwd);
////		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
//		if (user != null && user.getUserType().equals("admin")) {
//			session.setAttribute("adminUser", user);
//			System.out.println("Password: " + pwd);
////			String encryptedPassword = bCryptPasswordEncoder.encode(pwd);
////			System.out.println("User Login Pass: "+encryptedPassword);
////			user.setPassword(encryptedPassword);
////			System.out.println("DB Pass: "+user.getPassword());
////			bCryptPasswordEncoder.encode(user.getPassword()).matches(encryptedPassword);
////			System.out.println("DB Pass: "+user.getPassword());
////			System.out.println("Login Pass: "+encryptedPassword);
//			List<User> list = userDao.getEmpDetailsByEmail(em);
//			session.setAttribute("empList", list);
//			String encryptedPassword = bCryptPasswordEncoder.encode(pwd);
//			
//			System.out.println("Login Pass: "+encryptedPassword);
//			System.out.println("DB Pass: "+user.getPassword()); 
////			System.out.println("Bcryption: "+bCryptPasswordEncoder.matches(encryptedPassword, user.getPassword()));
//			if (bCryptPasswordEncoder.matches(pwd, user.getPassword())) {
//				System.out.println("Login Pass: " + pwd);
//				System.out.println();
//				System.out.println("DB Pass: " + user.getPassword());
//				return "admin"; // Passwords match, proceed to login
//			} else {
//				session.setAttribute("msg", "Invalid email and password");
//				session.removeValue(em);
//				session.invalidate();
//				return "redirect:/login";
//			}
////			return "admin";
//		} else if (user != null && user.getUserType().equals("user")) {
//			session.setAttribute("normalUser", user);
//			String encryptedPassword = bCryptPasswordEncoder.encode(user.getPassword());
//			user.setPassword(encryptedPassword);
//			List<User> list = userDao.getEmpByEmail(em);
//			session.setAttribute("empList", list);
//			session.removeValue(em);
//			session.invalidate();
//			return "profile";
//		} else {
////	    	session.invalidate();
//			session.setAttribute("msg", "Invalid email and password");
//			session.removeValue(em);
//			session.invalidate();
//			return "redirect:/login";
//		}
//		
//
//	}
	
	@PostMapping("/userLogin")
	public String login(@RequestParam("email") String em, @RequestParam("password") String pwd, HttpSession session) {

	    User user = userDao.loginUser(em, pwd);
	    BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

	    if (user != null && user.getUserType().equals("admin")) {
	        session.setAttribute("adminUser", user);
	        System.out.println("Password: " + pwd);
	        String encryptedPassword = bCryptPasswordEncoder.encode(pwd);
	        System.out.println("Login Pass: " + encryptedPassword);
	        System.out.println("DB Pass: " + user.getPassword());

	        if (bCryptPasswordEncoder.matches(pwd, user.getPassword())) {
	            System.out.println("Login Pass: " + pwd);
	            System.out.println("DB Pass: " + user.getPassword());
	            List<User> list = userDao.getEmpDetailsByEmail();
	            session.setAttribute("empList", list);
	            session.setAttribute("user", user);
	            
	            
	            return "admin"; // Passwords match, proceed to login
	        }
	    } else if (user != null && user.getUserType().equals("user")&& bCryptPasswordEncoder.matches(pwd, user.getPassword())) {
	        session.setAttribute("normalUser", user);
	        String encryptedPassword = bCryptPasswordEncoder.encode(user.getPassword());
	        user.setPassword(encryptedPassword);
	        List<User> list = userDao.getEmpByEmail(em);
	        session.setAttribute("empList", list);
	        session.setAttribute("user", user);
	       
	        
	        return "profile";
	    }
	    
	    // Invalid email or password
	    session.setAttribute("msg", "Invalid email and password");
	    session.invalidate();
	    return "redirect:/login";
	}


//	@PostMapping("/userLogin")
//	
//	public String login(@RequestParam("email") @Email(message = "Invalid Email Format") @NotEmpty(message = "Email is required") String em, 
//			@RequestParam("password") @NotEmpty(message = "Password is required") @Size(min = 10, message ="Password must be 10 characters long" ) String pwd, HttpSession session) {
//		
//		User user = new User(); 
//
//		 user = userDao.loginUser(em, pwd);
//		if (user != null && user.getUserType().equals("admin")) {
//			session.setAttribute("adminUser", user);
//			List<User> list = userDao.getEmpDetailsByEmail(em);
//			session.setAttribute("empList", list);
//			return "admin";
//			
////			return "admin";
//		}else if(user != null && user.getUserType().equals("user")) {
//			session.setAttribute("normalUser", user);
//			List<User> list =  userDao.getEmpByEmail(em);
////			model.addAttribute("em",list);
//			session.setAttribute("empList", list);
//			return "profile";
//		}
//
//		else {
//			session.setAttribute("msg", "invalid email and password");
//			return "redirect:/login";
//		}
//		}

	@RequestMapping("/myProfile")
	public String myProfile() {
		return "profile";
	}

	@RequestMapping("/logOut")
	public String logOut(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("loginuser");
		session.invalidate();
		session.setAttribute("msg", "LogOut Successfullly");
		
		return "login";
	}

	@RequestMapping("/addEmp")
	public String addEmp() {
		return "addEmp";
	}

//	@RequestMapping(path = "/createEmp", method = RequestMethod.POST)
	@PostMapping("/createEmp")
	public String createEmp(@ModelAttribute User user, Model model) {
		System.out.println(user);
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));

//		System.out.println(user);

		int i = userDao.saveEmp(user);
		model.addAttribute("msg", "Added Employee Sucessfully");
		return "redirect:/empDetails";
	}

//	@RequestMapping("/empDetails")
	@GetMapping("/empDetails")
	public String empDetails(Model model) {

		List<User> list = userDao.getAllEmployee();
		model.addAttribute("empList", list);
		return "empDetails";
	}

//	@RequestMapping(path = "/editDetails/{id}")
	@GetMapping("/editDetails/{id}")
	public String editDetail(@PathVariable int id, Model model) {
		User user = userDao.getEmployeeById(id);
		model.addAttribute("user", user);
//		System.out.println("User detals"+user);
		return "editDetails";
	}

//	@RequestMapping(path = "/editDetails/{id}")
	@GetMapping("/viewDetails/{id}")
	public String viewDetail(@PathVariable int id, Model model) {
		User user = userDao.getEmployeeById(id);
		model.addAttribute("user", user);
//		System.out.println("User detals"+user);
		return "view";
	}
	
	@GetMapping("/userViewDetail/{id}")
	public String userViewDetail(@PathVariable int id, Model model) {
		User user = userDao.getEmployeeById(id);
		model.addAttribute("user", user);
//		System.out.println("User detals"+user);
		return "userView";
	}
//	@GetMapping("/viewDetails/{id}")
//	public String viewDetail(@RequestParam("email") String em,HttpSession session) {
//		List<User> user =userDao.getEmployeeByem(em);
//		session.setAttribute("user", user);
////		System.out.println("User detals"+user);
//		return "view";
//	}

	@RequestMapping(path = "/updateEmployee", method = RequestMethod.POST)
//	@PutMapping("/updateEmployee")
	public String updateEmployee(@ModelAttribute("user") User user, HttpSession session) {
		System.out.println("-----------------------------------------------------------s");
		System.out.println("user: " + user);
		System.out.println("------------------------------------------------------------");
//		for(Address address2: user.getAddress()) {
//			address2.setUser(user);
//			System.out.println("address User: "+user);
//		}
		User exitingUser = userDao.getEmployeeById(user.getId());
		exitingUser.setAddress(user.getAddress());
		System.out.println("IDDD: " + user.getId());
		exitingUser.setFullName(exitingUser.getFullName());
		exitingUser.setDepartment(exitingUser.getDepartment());
		exitingUser.setContactNumber(exitingUser.getContactNumber());
		exitingUser.setAddress(exitingUser.getAddress());
		List<Address> addresses = exitingUser.getAddress();
		if (addresses != null && !addresses.isEmpty()) {
			for (Address address : addresses) {
				address.setUser(exitingUser);
			}
		}
		userDao.updateEmp(exitingUser);
		session.setAttribute("msg", "Update Succesfully");
		return "redirect:/empDetails";
	}

	@RequestMapping("/deleteEmployees/{id}")
//	@DeleteMapping("/deleteEmployee/{id}")
	public String deleteEmployee(@PathVariable int id, HttpSession session) {
		userDao.deleteEmp(id);
		session.setAttribute("msg", "Deleted Employee Details Successfully");
		return "redirect:/empDetails";
	}

//	@RequestMapping("/deleteAddress/{addressId}")
////	@DeleteMapping("/deleteEmployee/{id}")
//	public String deleteAddress(@PathVariable int addressId , Model model,@ModelAttribute Address address) {
//		userDao.deleteAddress(addressId);
//		model.addAttribute("msg", "Deleted Employee Address Successfully");
//		return "redirect:/empDetails";
//
//	}
	@DeleteMapping("/deleteAddress/{addressId}")
	@ResponseBody
	public String deleteAddress(@PathVariable int addressId, @ModelAttribute Address address) {
		userDao.deleteAddress(addressId);
		return "Delected Successfully";
	}

//	   @DeleteMapping("/delete-address/{addressId}")
//	   @ResponseBody
//	   public ResponseEntity<String> deleteAddress(@RequestParam("addressId") int addressId) {
//	     try {
//	    	 userDao.deleteAddress(addressId);
//	       return ResponseEntity.ok().build();
//	     } catch (Exception e) {
//	       return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error deleting address");
//	     }
//	   }

//    @GetMapping("/editDetails/{id}")
////    @ResponseBody
//    public ResponseEntity<User> viewEmployeeDetails(@PathVariable("id") int id) {
//        // Logic to retrieve employee details by ID from your data source (e.g., database)
//        User user = userDao.getEmployeeById(id);
//        
//        if (user != null) {
//            return ResponseEntity.ok(user);
//        } else {
//            return ResponseEntity.notFound().build();
//        }
//    }

	/////// ---------------------------------------------.///////////////////////////
	// For Multiple Addresss //
//	@PostMapping("/userAddress")
//	@RequestMapping(path = "/saveAddress", method = RequestMethod.POST)
//	public ResponseEntity<String> userData( @ModelAttribute User user, HttpSession session) {
//		
////		for(Address users : user) {
////			System.out.println("Address : "+user);
//		System.out.println("User: " + user);
//	    System.out.println("Name: " + user.getFullName());
//	    System.out.println("Email: " + user.getEmail());
//	    
//	    List<Address> addresses = user.getAddress();
//	    for (Address address : addresses) {
//	        System.out.println("PermanenetAddress: " + address.getPermanenetAddress());
//	        System.out.println("TemporaryAddress: " + address.getTemporaryAddress());
//	        System.out.println("StreetAddress: " + address.getStreetAddress());
//	        System.out.println("City: " + address.getCity());
//	        System.out.println("State/Province: " + address.getStateProvince());
//	        System.out.println("Country: " + address.getCountry());
//	    }
//			
////		}
//		return ResponseEntity.ok("Data Insert");
//	}

}