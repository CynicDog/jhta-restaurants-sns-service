package vo;

import dao.OwnerDao;

public class Store {
	
	private int id; 
	private int businessLicenseNumber; 
	private String address; 
	private int zipcode; 
	private float latitude; 
	private float longitude; 
	private String text;
	private String phone;
	private Owner owner;
	
	public Store() {
	}
	
	// for fetching 
	public Store(int id, int businessLicenseNumber, String address, int zipcode, float latitude, float longitude,
			String text, String phone, int ownerId) {
		
		this.id = id;
		this.businessLicenseNumber = businessLicenseNumber;
		this.address = address;
		this.zipcode = zipcode;
		this.latitude = latitude;
		this.longitude = longitude;
		this.text = text;
		this.phone = phone;
		this.owner = OwnerDao.getInstance().getOwnerById(ownerId);
	}
	
	// for storing 
	public Store(int businessLicenseNumber, String address, int zipcode, float latitude, float longitude, String text,
			String phone, int ownerId) {
	
		this.businessLicenseNumber = businessLicenseNumber;
		this.address = address;
		this.zipcode = zipcode;
		this.latitude = latitude;
		this.longitude = longitude;
		this.text = text;
		this.phone = phone;
		this.owner = OwnerDao.getInstance().getOwnerById(ownerId);
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
	public float getLatitude() {
		return latitude;
	}
	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}
	public float getLongitude() {
		return longitude;
	}
	public void setLongitude(float longitude) {
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
	public Owner getOwner() {
		return owner;
	}
	public void setOwner(Owner owner) {
		this.owner = owner;
	} 
	
	
	
	
}
