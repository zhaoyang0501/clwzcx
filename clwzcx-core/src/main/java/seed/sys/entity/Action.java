package seed.sys.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import seed.common.entity.BaseEntity;
import seed.core.entity.Department;


@Entity
@Table(name = "t_action")
public class Action extends BaseEntity<Long> {

	private String name;

	private String remark;

	@OneToOne
	private Department department;
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")  
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")  
	private Date actionDate;
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")  
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")  
	private Date endDate;
	
	private String addr;
	
	private String state;
	
	private String need;

	private Integer maxmnum;
	
	private Integer signnum;
	
	public Integer getMaxmnum() {
		return maxmnum;
	}

	public void setMaxmnum(Integer maxmnum) {
		this.maxmnum = maxmnum;
	}

	public Integer getSignnum() {
		return signnum;
	}

	public void setSignnum(Integer signnum) {
		this.signnum = signnum;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Date getActionDate() {
		return actionDate;
	}

	public void setActionDate(Date actionDate) {
		this.actionDate = actionDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getNeed() {
		return need;
	}

	public void setNeed(String need) {
		this.need = need;
	}

	

}
