package seed.sys.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import seed.common.entity.BaseEntity;
@Entity
@Table(name = "t_peccancy")
public class Peccancy extends BaseEntity<Long>{
	
	private String enginenum;
	
	private String type;
	
	private String pecdate;
	
	private Double cash;
	
	private String state;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")  
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")  
	
	private Date dealdate;
	
	private String remark;
	
	public String getEnginenum() {
		return enginenum;
	}
	public void setEnginenum(String enginenum) {
		this.enginenum = enginenum;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPecdate() {
		return pecdate;
	}
	public void setPecdate(String pecdate) {
		this.pecdate = pecdate;
	}
	public Double getCash() {
		return cash;
	}
	public void setCash(Double cash) {
		this.cash = cash;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Date getDealdate() {
		return dealdate;
	}
	public void setDealdate(Date dealdate) {
		this.dealdate = dealdate;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
}
