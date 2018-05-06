package seed.sys.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import seed.core.entity.User;

@ApiModel
@Entity
@Table(name = "t_bbs_article")
public class Article extends seed.common.entity.BaseEntity<Long>{
	
	@ApiModelProperty(value="帖子名称")
	private String  title;
	
	@ApiModelProperty(value="帖子内容")
	private String body;
	
	@ApiModelProperty(value="点击量")
	private Integer click=0;
	
	
	@ApiModelProperty(value="发表人")
	@OneToOne
	private User user;
	
	
	
	
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	

	public Integer getClick() {
		return click;
	}

	public void setClick(Integer click) {
		this.click = click;
	}


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
}
