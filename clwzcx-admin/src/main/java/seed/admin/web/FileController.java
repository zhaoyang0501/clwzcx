package seed.admin.web;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import seed.common.web.AbstractBaseCURDController;
import seed.core.entity.User;
import seed.sys.entity.File;
import seed.sys.service.FileService;
/***
 * @author 263608237@qq.com
 *
 */
@Controller
@RequestMapping("sys/file")
public class FileController extends AbstractBaseCURDController<File,Long>  {
	
	@InitBinder
    protected void initBinder(WebDataBinder binder) throws Exception {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }
	
	@Override
	public FileService getSimpleCurdService() {
		return (FileService)super.getSimpleCurdService();
	}
	
	@Override
	public String getBasePath() {
		return "sys/file";
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
	@RequestMapping("userindex")
	public String userindex(Model model) {
		return this.getBasePath()+"/userindex";
	}
	
	@RequestMapping("fileupload")
	public String fileupload(Model model) {
		return this.getBasePath()+"/fileupload";
	}
	
	@RequestMapping("download")
	public String fileupload(Long id,String path) {
		File file = this.simpleCurdService.find(id);
		file.setNum(file.getNum()+1);
		this.simpleCurdService.save(file);
		 return "redirect:"+path;
	}
	
	@RequestMapping("doupload")
	public String doupload(@RequestParam("file") MultipartFile file,Model model,String remark,HttpServletRequest request) {
		System.out.println(file.getOriginalFilename());
		System.out.println(remark);
		System.out.println( request.getSession().getServletContext().getRealPath("imgupload/"));
		
	        try {

	            byte[] bytes = file.getBytes();
	            Path path = Paths.get( request.getSession().getServletContext().getRealPath("imgupload/")+ file.getOriginalFilename());
	            Files.write(path, bytes);

	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        
	    File bean = new File();
	    bean.setName(file.getOriginalFilename());
	    bean.setPath("/imgupload/"+file.getOriginalFilename());
	    bean.setNum(0);
	    bean.setCreateDate(new Date());
	    bean.setUser((User)SecurityUtils.getSubject().getSession().getAttribute("currentUser"));
	    this.simpleCurdService.save(bean);
	    model.addAttribute("tip", "ok");
		return this.getBasePath()+"/fileupload";
	}
	
	
}
