package seed.core.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import seed.common.entity.BaseEntity;

@Entity
@Table(name = "t_sys_user")
public class User extends BaseEntity<Long> implements Serializable{
	
	private static final long serialVersionUID = 2927194419168198403L;
	
	public static final String DEFAULT_PASSWORD="123456";
	
	private String username;
	
	@JsonIgnore
	private String password;
	
	private String email;
	
	private String salt;
	
	private String remark;
	
	private String tel;
	
	private String chinesename ="";
	
	private String sex;
	

	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")  
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")  
	private Date birthday;
	@OneToOne
	private Department department;
	
	private Integer score = 0;
	@OneToMany
	private Set<Role> roles;
	
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
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
	public String getChinesename() {
		return chinesename;
	}
	public void setChinesename(String chinesename) {
		this.chinesename = chinesename;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	
	
}
