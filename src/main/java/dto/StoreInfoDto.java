package dto;

public class StoreInfoDto {

	// Store 클래스 필드 추가
    private int storeId;
    private String storeName;
    private int businessLicenseNumber;
    private String address;
    private int zipcode;
    private double latitude;
    private double longitude;
    private String text;
    private String phone;
    private String dayOffs;
    
    // StoreOpentime 클래스 필드 추가
    private int opentimeId;
    private String operationTime;
    
    // Food 클래스 필드 추가
    private int foodId;
    private String foodName;
    private int foodPrice;
    private String foodCategory;
    private String foodSoldOut;
    private String foodPictureLocation;
    
    public StoreInfoDto() {}

	public int getStoreId() {
		return storeId;
	}


	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}


	public String getStoreName() {
		return storeName;
	}


	public void setStoreName(String storeName) {
		this.storeName = storeName;
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


	public int getOpentimeId() {
		return opentimeId;
	}


	public void setOpentimeId(int opentimeId) {
		this.opentimeId = opentimeId;
	}


	public String getOperationTime() {
		return operationTime;
	}


	public void setOperationTime(String operationTime) {
		this.operationTime = operationTime;
	}


	public int getFoodId() {
		return foodId;
	}


	public void setFoodId(int foodId) {
		this.foodId = foodId;
	}


	public String getFoodName() {
		return foodName;
	}


	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}


	public int getFoodPrice() {
		return foodPrice;
	}


	public void setFoodPrice(int foodPrice) {
		this.foodPrice = foodPrice;
	}


	public String getFoodCategory() {
		return foodCategory;
	}


	public void setFoodCategory(String foodCategory) {
		this.foodCategory = foodCategory;
	}


	public String getFoodSoldOut() {
		return foodSoldOut;
	}


	public void setFoodSoldOut(String foodSoldOut) {
		this.foodSoldOut = foodSoldOut;
	}


	public String getFoodPictureLocation() {
		return foodPictureLocation;
	}


	public void setFoodPictureLocation(String foodPictureLocation) {
		this.foodPictureLocation = foodPictureLocation;
	}
	
}
