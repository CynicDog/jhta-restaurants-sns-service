package vo;

import java.util.Date;

public class Owner {
	
	private int id;
	private String owner_id;
	private String password;
	private String name;
	private String email;
	private String phone;
	private Date birthday;
	private String gender;
	private String grade;
	private String subscription;
	private Date createDate;
	private Date updateDate;
	
	public Owner() {}

	// for fetching 
	public Owner(int id, String owner_id, String password, String name, String email, String phone, Date birthday,
			String gender, String grade, String subscription, Date createDate, Date updateDate) {
		super();
		this.id = id;
		this.owner_id = owner_id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.birthday = birthday;
		this.gender = gender;
		this.grade = grade;
		this.subscription = subscription;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	
	// for storing 
	public Owner(int id, String owner_id, String password, String name, String email, String phone, Date birthday,
			String gender, String grade, String subscription) {
		super();
		this.id = id;
		this.owner_id = owner_id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.birthday = birthday;
		this.gender = gender;
		this.grade = grade;
		this.subscription = subscription;
	}

	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getOwner_id() {
		return owner_id;
	}



	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
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

	public String getSubscription() {
		return subscription;
	}

	public void setSubscription(String subscription) {
		this.subscription = subscription;
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
