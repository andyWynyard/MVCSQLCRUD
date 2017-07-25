package data;

public class Location {
	
	private int id;
	private String country_name;
	private String gps_coords;
	private int bucketId;
	
	public Location(int id, String country_name, String gps_coords) {
		super();
		this.id = id;
		this.country_name = country_name;
		this.gps_coords = gps_coords;
	}
	
	public Location() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCountry_name() {
		return country_name;
	}

	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}

	public String getGps_coords() {
		return gps_coords;
	}

	public void setGps_coords(String gps_coords) {
		this.gps_coords = gps_coords;
	}

	@Override
	public String toString() {
		return "Location [id=" + id + ", country_name=" + country_name + ", gps_coords=" + gps_coords + ", bucketId="
				+ bucketId + "]";
	}

	public int getBucketId() {
		return bucketId;
	}
	
	public void setBucketId(int bucketId) {
		this.bucketId = bucketId;
	}
	
	

}
