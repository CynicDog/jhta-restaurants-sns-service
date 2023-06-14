package vo;

import dao.OwnerDao;

public class Store {
	
	private int id; 
	private String name;
	private int businessLicenseNumber; 
	private String address; 
	private int zipcode; 
	private double latitude; 
	private double longitude; 
	private String text;
	private String phone;
	private String dayOffs; 
	private Owner owner;
	
	public Store() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBusinessLicenseNumber() {
		return businessLicenseNumber;
	}
	public void setBusinessLicenseNumber(int businessLicenseNumber) {
		this.businessLicenseNumber = businessLicenseNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDayOffs() {
		return dayOffs;
	}
	public void setDayOffs(String dayOffs) {
		this.dayOffs = dayOffs;
	}
	public Owner getOwner() {
		return owner;
	}
	public void setOwner(Owner owner) {
		this.owner = owner;
	} 
	
	
	
	
}
