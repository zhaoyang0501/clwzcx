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

import seed.common.dto.json.FailedResponse;
import seed.common.dto.json.Response;
import seed.common.dto.json.SuccessResponse;
import seed.common.web.AbstractBaseCURDController;
import seed.core.entity.User;
import seed.core.service.DepartmetService;
import seed.sys.entity.Action;
import seed.sys.entity.Msg;
import seed.sys.entity.Sign;
import seed.sys.service.ActionService;
import seed.sys.service.MsgService;
import seed.sys.service.SignService;
/***
 * @author 263608237@qq.com
 *
 */
@Controller
@RequestMapping("sys/msg")
public class MsgController extends AbstractBaseCURDController<Msg,Long>  {
	
	@InitBinder
    protected void initBinder(WebDataBinder binder) throws Exception {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }
	
	@Autowired
	private DepartmetService departmetService;
	
	@Autowired
	private SignService signtService;
	
	
	@Override
	public MsgService getSimpleCurdService() {
		return (MsgService)super.getSimpleCurdService();
	}
	
	@Override
	public String getBasePath() {
		return "sys/msg";
	}
	
	
	@RequestMapping("msgdelete")
	public String msgdelete(Model model) {
		return this.getBasePath()+"/msgdelete";
	}
	
	
	
	@Override
	@RequestMapping("index")
	public String index(Model model) {
		model.addAttribute("depts", this.departmetService.findAll());
		model.addAttribute("msgs", this.simpleCurdService.findAll());
		return this.getBasePath()+"/index";
	}
	
	@RequestMapping("savemsg")
	public String savemsg(Model model,String msg) {
		User user= (User)SecurityUtils.getSubject().getSession().getAttribute("currentUser");
		
		Msg msgbox = new Msg();
		msgbox.setMsgDate(new Date());
		msgbox.setUser(user);
		msgbox.setMsg(msg);
		simpleCurdService.save(msgbox);
		model.addAttribute("tip", "ok");
		
		model.addAttribute("msgs", this.simpleCurdService.findAll());
		return this.getBasePath()+"/index";
	}
	
}
