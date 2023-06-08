package vo;

import java.util.Date;

public class Admin {

	private int id;
	private String adminId;
	private String password;
	private String name;
	private String email;
	private String phone;
	private Date birthday;
	private String gender;
	private Date createDate;
	private Date updateDate;
	
	public Admin() {}
	
	// for fetching 
	public Admin(int id, String adminId, String password, String name, String email, String phone, Date birthday,
			String gender, Date createDate, Date updateDate) {
		this.id = id;
		this.adminId = adminId;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.birthday = birthday;
		this.gender = gender;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	
	// storing 
	public Admin(String adminId, String password, String name, String email, String phone, Date birthday,
			String gender) {
		
		this.adminId = adminId;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.birthday = birthday;
		this.gender = gender;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
}
