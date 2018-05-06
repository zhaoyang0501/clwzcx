package seed.sys.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import seed.common.entity.BaseEntity;
import seed.core.entity.Department;
import seed.core.entity.User;


@Entity
@Table(name = "t_sign")
public class Sign extends BaseEntity<Long> {
	
	@OneToOne
	private User user;
	
	private Date signDate;
	
	@OneToOne
	private Action action;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getSignDate() {
		return signDate;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

	public Action getAction() {
		return action;
	}

	public void setAction(Action action) {
		this.action = action;
	}
	

}
