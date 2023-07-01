
package com.springmvc.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView registerUser(@ModelAttribute User user,HttpSession session) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));

		userDao.saveUser(user);
	
		ModelAndView mv=new ModelAndView();
		mv.addObject("msg", "User Register Successfully");
		mv.setViewName("register");

		return mv;
		
	}
	
//	@RequestMapping(path = "/userlogin", method = RequestMethod.POST)
	@PostMapping("/userLogin")
	public String login(@RequestParam("email") String em, @RequestParam("password") String pwd, HttpSession session) {
		User user = new User(); 

		 user = userDao.loginUser(em, pwd);
		if (user != null && user.getUserType().equals("admin")) {
			session.setAttribute("adminUser", user);
			List<User> list = userDao.getEmpDetailsByEmail(em);
			session.setAttribute("empList", list);
			return "admin";
			
//			return "admin";
		}else if(user != null && user.getUserType().equals("user")) {
			session.setAttribute("normalUser", user);
			List<User> list =  userDao.getEmpByEmail(em);
//			model.addAttribute("em",list);
			session.setAttribute("empList", list);
			return "profile";
		}

		else {
			session.setAttribute("msg", "invalid email and password");
			return "redirect:/login";
		}
		}

	
	@RequestMapping("/myProfile")
	public String myProfile() {
		return "profile";
	}
	
	@RequestMapping("/logOut")
	public String logOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginuser");
		session.setAttribute("msg", "LogOut Successfullly");
		return "login";
	}

	@RequestMapping("/addEmp")
	public String addEmp() {
		return "addEmp";
	}
	
//	@RequestMapping(path = "/createEmp", method = RequestMethod.POST)
	@PostMapping("/createEmp")
	public String createEmp(@ModelAttribute User user, HttpSession session) {
		System.out.println(user);
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		
//		System.out.println(user);

		int i = userDao.saveEmp(user);
		session.setAttribute("msg", "Added Employee Sucessfully");
		return "redirect:/empDetails";
	}

	
//	@RequestMapping("/empDetails")
	@GetMapping("/empDetails")
	public String empDetails(Model model ) {
		
		List<User> list=userDao.getAllEmployee();
		model.addAttribute("empList",list);
		return "empDetails";
	}
	
//	@RequestMapping(path = "/editDetails/{id}")
	@GetMapping("/editDetails/{id}")
	public String editDetail(@PathVariable int id,Model model) {
		User user =userDao.getEmployeeById(id);
		model.addAttribute("user",user);
//		System.out.println("User detals"+user);
		return "editDetails";
	}
//	@RequestMapping(path = "/editDetails/{id}")
	@GetMapping("/viewDetails/{id}")
	public String viewDetail(@PathVariable int id,Model model) {
		User user =userDao.getEmployeeById(id);
		model.addAttribute("user",user);
//		System.out.println("User detals"+user);
		return "view";
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
	public String updateEmployee(@ModelAttribute("user") User user,HttpSession session) {
		System.out.println("-----------------------------------------------------------s");
		System.out.println("user: "+user);
		System.out.println("------------------------------------------------------------");
//		for(Address address2: user.getAddress()) {
//			address2.setUser(user);
//			System.out.println("address User: "+user);
//		}
		User exitingUser = userDao.getEmployeeById(user.getId());
		exitingUser.setAddress(user.getAddress());
		System.out.println("IDDD: "+user.getId());
		exitingUser.setFullName(exitingUser.getFullName());
		exitingUser.setDepartment(exitingUser.getDepartment());
		exitingUser.setContactNumber(exitingUser.getContactNumber());
		exitingUser.setAddress(exitingUser.getAddress());
		List<Address> addresses = exitingUser.getAddress();
		if(addresses != null && !addresses.isEmpty()) {
			for(Address address: addresses) {
				address.setUser(exitingUser);
			}
		}
		
		
//		exitingUser.setPassword(exitingUser.getPassword());
//		exitingUser.setUserType(exitingUser.getUserType());
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
	
	///////---------------------------------------------.///////////////////////////
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