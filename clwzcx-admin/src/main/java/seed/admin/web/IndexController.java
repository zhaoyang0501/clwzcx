package seed.admin.web;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import seed.common.exception.AlreadyExistedException;
import seed.core.entity.User;
import seed.core.service.UserService;
/***
 * @author 263608237@qq.com
 *
 */
@Controller
public class IndexController {
	
	@Autowired
	UserService  userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		Subject subject = SecurityUtils.getSubject();
		if(subject.isAuthenticated()||subject.isRemembered()){
			return "dologin";
		} 
		  return "login";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model)  {
		  return "register";
	}
	@RequestMapping(value = "/doregister", method = RequestMethod.POST)
	public String doregister(Model model,User user) throws AlreadyExistedException {
		   userService.registerUser(user);
		   model.addAttribute("tip", "注册成功，请登录！");  
		  return "login";
	}
	/***
	 * 登陆的逻辑已经被shiro过滤器处理，这里只要读取shiro处理后得到的结果
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String dologin(HttpServletRequest req,Model model) {
		 String exceptionClassName = (String)req.getAttribute("shiroLoginFailure");  
	        String error = null;  
	        if(UnknownAccountException.class.getName().equals(exceptionClassName)) {  
	            error = "用户名/密码错误";  
	        } else if(IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {  
	            error = "用户名/密码错误";  
	        } else if(exceptionClassName != null) {  
	            error = "其他错误：" + exceptionClassName;  
	        }  
	        model.addAttribute("tip", error);  
		return "login";
	}
	
	@RequestMapping(value = "/loginout", method = RequestMethod.GET)
	public String loginout(Model model) {
		SecurityUtils.getSubject().logout();
		return "login";
	}
	
	@RequestMapping(value = {"/","","index"}, method = RequestMethod.GET)
	public String  index(HttpSession session,Model model) {
		return "index";
	}

}
