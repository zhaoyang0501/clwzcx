package cmcc.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import seed.core.entity.User;
import seed.core.service.UserService;
import seed.sys.entity.Car;
import seed.sys.service.ArticleService;
import seed.sys.service.CarService;
import seed.sys.service.PeccancyService;
/***
 * 
 *开发售后  @author qq:263608237@qq.com
 *
 */
@Controller
@SessionAttributes("user")  
public class IndexController {
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	PeccancyService peccancyService;
	
	@Autowired
	CarService carService;
	
	@InitBinder
    protected void initBinder(WebDataBinder binder) throws Exception {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model) {
		return "register";
	}
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public String download(Model model) {
		return "download";
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(Model model) {
		return "about";
	}
	
	@RequestMapping(value = "/wz", method = RequestMethod.GET)
	public String wz(Model model) {
		return "wz";
	}
	
	@RequestMapping(value = "/car", method = RequestMethod.GET)
	public String car(Model model,HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		model.addAttribute("cars",carService.findByIdcard(user.getUsername()));
		return "car";
	}
	
	@RequestMapping(value = "/addcar", method = RequestMethod.GET)
	public String addcar(Model model,HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		return "addcar";
	}
	
	@RequestMapping(value = "/addcar", method = RequestMethod.POST)
	public String doaddcar(Car car, Model model,HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		model.addAttribute("tip","车辆添加成功");
		this.carService.save(car);
		model.addAttribute("cars",carService.findByIdcard(user.getUsername()));
		return "car";
	}
	
	@RequestMapping(value = "/dropcar", method = RequestMethod.GET)
	public String dropcar(Model model,HttpSession httpSession,Long carid) {
		Car car = carService.find(carid);
		car.setState("作废");
		carService.save(car);
		User user = (User)httpSession.getAttribute("user");
		model.addAttribute("cars",carService.findByIdcard(user.getUsername()));
		return "car";
	}
	
	@RequestMapping(value = "/wz", method = RequestMethod.POST)
	public String wz(Model model,String num) {
		model.addAttribute("wzs",peccancyService.findByEnginenum(num));
		return "wz";
	}
	@RequestMapping(value = "/password", method = RequestMethod.GET)
	public String password(Model model,HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		if(user==null)
			return "redirect:/login"; 
		return "password";
	}
	
	
	
	@RequestMapping(value = "/center", method = RequestMethod.GET)
	public String center(Model model,HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		if(user==null)
			return "redirect:/login"; 
		return "center";
	}
	
	@RequestMapping(value = "/loginout", method = RequestMethod.GET)
	public String loginout(Model model, SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/bbs";  
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model,String username,String password) {
		
			//开始登陆逻辑
			User user = userService.login(username, password);
			if(user ==null){
				model.addAttribute("tip","用户名密码不正确,错误次数超过5次将被锁定！");
				return "login";
			}else{
				model.addAttribute("user",user);
				return "redirect:/index";  
			}
	}
	
	@RequestMapping(value = "/doregister", method = RequestMethod.POST)
	public String doregister(Model model,User user) {
		user.setPassword( DigestUtils.md5Hex(User.DEFAULT_PASSWORD));
		userService.save(user);
		model.addAttribute("tip","注册成功，请登录！");
		return "login";
	}
	@RequestMapping(value = "/bbs", method = RequestMethod.GET)
	public String bbs(Model model) {
		return "bbs";
	}
	
	
	
	
	
	@RequestMapping(value = {"/index"}, method = RequestMethod.GET)
	public String index1(Model model) {
		model.addAttribute("news",articleService.findAll());
		return "index";
	}
	
	@RequestMapping(value = {"/newsdetail"}, method = RequestMethod.GET)
	public String news(Model model,Long id) {
		model.addAttribute("bbs",articleService.find(id));
		return "newsdetail";
	}
	@RequestMapping(value = {"/"}, method = RequestMethod.GET)
	public String index2(Model model) {
		return "redirect:/index";  
	}
	
	
	@RequestMapping(value = "/updateuser", method = RequestMethod.POST)
	public String bbsnew(Model model,HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		
		return "redirect:/center"; 
	}
	/***
     * 判断密码强度是否过于简单 
     * 1 长度不能小于6 
     * 2 不能由纯数字构成 
     * 3 不能由纯字母构成
     * 
     * @param password
     * @return 如果是简单密码 返回true
     */
    private  boolean isSimplePassword(String password) {
        String pattern1 = "^\\d+$";
        String pattern2 = "^[a-zA-Z]+$";
        if (null == password || password.length() <= 6 || password.matches(pattern1) || password.matches(pattern2))
            return true;
        else
            return false;
    }
}
