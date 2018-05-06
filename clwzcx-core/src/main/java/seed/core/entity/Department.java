package seed.core.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

import seed.common.entity.BaseEntity;

@Entity
@Table(name = "t_sys_dept")
public class Department extends BaseEntity<Long> implements Serializable{
	private String name;
	private String remark;
	private String tel;
	private String addr;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
}
