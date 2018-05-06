package seed.admin.web;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import seed.common.web.AbstractBaseCURDController;
import seed.core.service.DepartmetService;
import seed.sys.entity.Peccancy;
import seed.sys.service.PeccancyService;
/***
 * @author 263608237@qq.com
 *
 */
@Controller
@RequestMapping("sys/peccancy")
public class PeccancyController extends AbstractBaseCURDController<Peccancy,Long>  {
	
	@InitBinder
    protected void initBinder(WebDataBinder binder) throws Exception {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }
	
	@Autowired
	private DepartmetService departmetService;
	
	@Override
	public PeccancyService getSimpleCurdService() {
		return (PeccancyService)super.getSimpleCurdService();
	}
	
	@Override
	public String getBasePath() {
		return "sys/peccancy";
	}
	
	
	@Override
	@RequestMapping("index")
	public String index(Model model) {
		model.addAttribute("depts", this.departmetService.findAll());
		return this.getBasePath()+"/index";
	}
	
}
