package seed.admin.web;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import seed.common.web.AbstractBaseCURDController;
import seed.core.entity.Department;
import seed.core.service.DepartmetService;
/***
 * @author 263608237@qq.com
 *
 */
@Controller
@RequestMapping("sys/department")
public class DepartmentController extends AbstractBaseCURDController<Department,Long>  {
	
	@Override
	public DepartmetService getSimpleCurdService() {
		return (DepartmetService)super.getSimpleCurdService();
	}
	
	@Override
	public String getBasePath() {
		return "sys/department";
	}
	
	
}
