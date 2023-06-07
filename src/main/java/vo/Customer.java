package vo;

import java.util.Date;

public class Customer {

	private int id;
	private String userId;
	private String password;
	private String name;
	private String email;
	private String phone;
	private Date birthday;
	private String gender;
	private String grade;
	private Date createDate;
	private Date updateDate;
	
	public Customer() {}
	
	// for fetching 
	public Customer(int id, String userId, String password, String name, String email, String phone, Date birthday,
			String gender, String grade, Date createDate, Date updateDate) {
		this.id = id;
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.birthday = birthday;
		this.gender = gender;
		this.grade = grade;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	
	// for storing 
	public Customer(String userId, String password, String name, String email, String phone, Date birthday,
			String gender, String grade) {

		this.userId = userId;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.birthday = birthday;
		this.gender = gender;
		this.grade = grade;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
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