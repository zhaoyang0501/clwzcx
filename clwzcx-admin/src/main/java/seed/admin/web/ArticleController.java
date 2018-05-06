package seed.admin.web;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import seed.common.dto.json.DataTableResponse;
import seed.common.dto.json.Response;
import seed.common.dto.json.SuccessResponse;
import seed.common.web.AbstractBaseCURDController;
import seed.core.entity.User;
import seed.sys.entity.Article;
import seed.sys.service.ArticleService;

@Controller
@RequestMapping("sys/article")
public class ArticleController extends AbstractBaseCURDController<Article,Long>  {
	
	@Override
	public ArticleService getSimpleCurdService() {
		return (ArticleService)super.getSimpleCurdService();
	}
	
	@Override
	public String getBasePath() {
		return "sys/article";
	}
	
	@RequestMapping("create")
	public String create(Model model) {
		return this.getBasePath()+"/create";
	}
	
	@RequestMapping(value="docraete",method=RequestMethod.POST)
	public String docraete(Model model,Article article) {
		User user= (User)SecurityUtils.getSubject().getSession().getAttribute("currentUser");
		
		article.setUser(user);
		this.getSimpleCurdService().save(article);
		model.addAttribute("response",new SuccessResponse("操作成功"));
		return this.getBasePath()+"/create";
	}
	
	@Override
	@RequestMapping("index")
	public String index(Model model) {
		return this.getBasePath()+"/index";
	}
	
	@RequestMapping("viewindex")
	public String viewindex(Model model) {
		return this.getBasePath()+"/viewindex";
	}
	
	@RequestMapping(value="goview/{id}",method=RequestMethod.GET)
	public String goview(Model model,@PathVariable Long id) {
		model.addAttribute("article",this.getSimpleCurdService().find(id));
		return this.getBasePath()+"/view";
	}
	/***
	 * 跳转到修改帖子界面
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="goupdate/{id}",method=RequestMethod.GET)
	public String goupdate(Model model,@PathVariable Long id) {
		model.addAttribute("article",this.getSimpleCurdService().find(id));
		return this.getBasePath()+"/update";
	}
	/***
	 * 确认修改
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="goupdate",method=RequestMethod.POST)
	public String goupdate(Model model,Article article) {
		this.getSimpleCurdService().save(article);
		
		model.addAttribute("response",new SuccessResponse("操作成功"));
		return this.getBasePath()+"/index";
	}
	
	
	@RequestMapping("listall")
	@ResponseBody
	public Response listall(Integer start, Integer length, String title,Long categoryid) {
		int pageNumber = (int) (start / length) + 1;
		int pageSize = length;
		Page<Article> m = this.getSimpleCurdService().findAll(pageNumber, pageSize, title,categoryid);
		return new DataTableResponse<Article>( m.getContent(),(int) m.getTotalElements() );
	}

	
	@ModelAttribute
	public Article preget(@RequestParam(required=false) Long id) {
		Article article = new Article();
		if (id!=null){
			article = this.getSimpleCurdService().find(id);
		}
		return article;
	}
}
