package seed.admin.web;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import seed.common.dto.json.Response;
import seed.common.dto.json.SuccessResponse;
import seed.common.web.AbstractBaseCURDController;
import seed.core.entity.User;
import seed.core.service.DepartmetService;
import seed.sys.entity.Action;
import seed.sys.entity.Sign;
import seed.sys.service.ActionService;
import seed.sys.service.SignService;
/***
 * @author 263608237@qq.com
 *
 */
@Controller
@RequestMapping("sys/action")
public class ActionController extends AbstractBaseCURDController<Action,Long>  {
	
	@InitBinder
    protected void initBinder(WebDataBinder binder) throws Exception {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }
	
	@Autowired
	private DepartmetService departmetService;
	
	@Autowired
	private SignService signtService;
	
	
	@Override
	public ActionService getSimpleCurdService() {
		return (ActionService)super.getSimpleCurdService();
	}
	
	@Override
	public String getBasePath() {
		return "sys/action";
	}
	
	
	@Override
	@RequestMapping("index")
	public String index(Model model) {
		model.addAttribute("depts", this.departmetService.findAll());

		return this.getBasePath()+"/index";
	}
	
	

	@RequestMapping("myaction")
	public String myaction(Model model) {
		User user= (User)SecurityUtils.getSubject().getSession().getAttribute("currentUser");
		model.addAttribute("signs",signtService.findByUser(user));
		return this.getBasePath()+"/myaction";
	}
	
	
	
	@RequestMapping("sign")
	public String sign(Model model) {
		model.addAttribute("depts", this.departmetService.findAll());
		return this.getBasePath()+"/sign";
	}
	
	
	@RequestMapping("dosign")
	@ResponseBody
	public Response dosign(Long id) {
		Action action =  this.getSimpleCurdService().find(id);
		action.setSignnum(action.getSignnum()+1);
		this.getSimpleCurdService().save(action);
		User user= (User)SecurityUtils.getSubject().getSession().getAttribute("currentUser");
		 Sign sign = new Sign();
		 sign.setAction(action);
		 sign.setUser(user);
		 sign.setSignDate(new Date());
		 signtService.save(sign);
		return new SuccessResponse();
	}
}
