package vo;


public class Customer {

	private int id; 	// auto_increment  
	
	private String name;

	
	public Customer() {}
	
	// for storing 
	public Customer(String name) {
		this.name = name; 
	}
	
	// for fetching 
	public Customer(int id, String name) {
		this.id = id; 
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public int getId() {
		return id; 
	}
}
