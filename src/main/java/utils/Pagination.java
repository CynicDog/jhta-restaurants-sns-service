package utils;

public class Pagination {
	

	private int page; 
	private int rows = 6;
	private int pages = 5;
	private int totalRows;  
	
	public Pagination(int page, int totalRows) {
		this.page = page;  
		this.totalRows = totalRows; 
	}
	
	public Pagination(int page, int rows, int totalRows) {
		super();
		this.page = page;
		this.rows = rows;
		this.totalRows = totalRows;
	}

	public int getStartingRow() {
		return (page - 1) * rows + 1; 
	}
	
	public int getEndingRow() { 
		return page * rows;  
	}
	
	public int getTotalPages() { return (int) Math.ceil((double) totalRows / rows); }   

    public int getTotalBlocks() { return (int) Math.ceil((double) getTotalPages() / pages); }  

    public int getCurrentBlock() { return (int) Math.ceil((double) page / pages); }  

    public int getStartingPage() { return (getCurrentBlock() - 1)  * pages + 1; }
    
    public int getEndingPage() {
        if (getCurrentBlock() >= getTotalBlocks()) {

            return getTotalPages();
        }

        return getCurrentBlock() * pages; 
    }	
}
