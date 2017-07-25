package data;

public class Picture {
	
	private int id;
	private String url;
	private String description;
	private int bucketId;
	private int locationId;
	
	public Picture(int id, String url, String description) {
		super();
		this.id = id;
		this.url = url;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Picture [id=" + id + ", url=" + url + ", description=" + description + ", bucketId=" + bucketId
				+ ", locationId=" + locationId + "]";
	}

	public int getBucketId() {
		return bucketId;
	}
	
	public void setBucketId(int bucketId) {
		this.bucketId = bucketId;
	}
	
	public int getLocationId() {
		return locationId;
	}
	
	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

}
