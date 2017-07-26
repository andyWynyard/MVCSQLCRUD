package data;

public class Bucket {
	private int id;
	private String objectPerson;
	private String timeFrame;
	

	public Bucket(int id, String objectPerson, String timeFrame) {
		super();
		this.id = id;
		this.objectPerson = objectPerson;
		this.timeFrame = timeFrame;
	}

	public Bucket() {

	}

	public Bucket(String objectPerson, String timeFrame) {
		super();
		this.objectPerson = objectPerson;
		this.timeFrame = timeFrame;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getObjectPerson() {
		return objectPerson;
	}

	public void setObjectPerson(String objectPerson) {
		this.objectPerson = objectPerson;
	}

	public String getTimeFrame() {
		return timeFrame;
	}

	public void setTimeFrame(String timeFrame) {
		this.timeFrame = timeFrame;
	}

	@Override
	public String toString() {
		return "Bucket [id=" + id + ", objectPerson=" + objectPerson + ", timeFrame=" + timeFrame + "]";
	}

}
