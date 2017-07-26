package data;

public class Location {
	
	private int id;
	private String countryName;
	private String gps_coords;
	private int bucketId;
	
	public Location(int id, String countryName, String gps_coords) {
		super();
		this.id = id;
		this.countryName = countryName;
		this.gps_coords = gps_coords;
	}
	
	public Location(int id, String countryName, int bucketId) {
		super();
		this.id = id;
		this.countryName = countryName;
		this.bucketId = bucketId;
	}
	
	
	public Location(String countryName, String gps_coords, int bucketId) {
		super();
		this.countryName = countryName;
		this.gps_coords = gps_coords;
		this.bucketId = bucketId;
	}




	public Location(String countryName, int bucketId) {
		super();
		this.countryName = countryName;
		this.bucketId = bucketId;
	}



	public Location() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getGps_coords() {
		return gps_coords;
	}

	public void setGps_coords(String gps_coords) {
		this.gps_coords = gps_coords;
	}

	@Override
	public String toString() {
		return "Location [id=" + id + ", countryName=" + countryName + ", gps_coords=" + gps_coords + ", bucketId="
				+ bucketId + "]";
	}

	public int getBucketId() {
		return bucketId;
	}
	
	public void setBucketId(int bucketId) {
		this.bucketId = bucketId;
	}
	
	

}
