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
import seed.sys.entity.Car;
import seed.sys.entity.Sign;
import seed.sys.service.ActionService;
import seed.sys.service.CarService;
import seed.sys.service.SignService;
/***
 * @author 263608237@qq.com
 *
 */
@Controller
@RequestMapping("sys/car")
public class CarController extends AbstractBaseCURDController<Car,Long>  {
	
	@InitBinder
    protected void initBinder(WebDataBinder binder) throws Exception {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }
	
	@Autowired
	private DepartmetService departmetService;
	
	@Override
	public CarService getSimpleCurdService() {
		return (CarService)super.getSimpleCurdService();
	}
	
	@Override
	public String getBasePath() {
		return "sys/car";
	}
	
	
	@Override
	@RequestMapping("index")
	public String index(Model model) {
		model.addAttribute("depts", this.departmetService.findAll());
		return this.getBasePath()+"/index";
	}
	
}
