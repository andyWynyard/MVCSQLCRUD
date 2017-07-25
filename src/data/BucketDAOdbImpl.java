package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class BucketDAOdbImpl implements BucketDAOdb {
	private static String url = "jdbc:mysql://localhost:3306/sdvid";
	private String user = "bucketuser";
	private String pass = "bucketuser";
	Bucket bucket = null;
	Location location = null;
	Picture picture = null;
	

	public BucketDAOdbImpl() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("Error loading MySQL Driver!!!");
		}
	}

	@Override
	public Bucket getBucketById(int id) {
		
		try {
			Connection conn = DriverManager.getConnection(url, user, pass);
			String sql = "Select id, object_person, time_frame FROM bucket WHERE id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				bucket = new Bucket(rs.getInt(1), rs.getString(2), rs.getString(3));
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(bucket);
		return bucket;
	}
	
	
	@Override
	public Location getLocationById(int id) {		
		try {
			Connection conn = DriverManager.getConnection(url, user, pass);
			String sql = "Select id, country_name, gps_coords FROM location WHERE id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				location = new Location(rs.getInt(1), rs.getString(2), rs.getString(3));
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(location);
		return location;
	}
	
	@Override
	public Picture getPictureById(int id) {		
		try {
			Connection conn = DriverManager.getConnection(url, user, pass);
			String sql = "Select id, description, url FROM pictures WHERE id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				picture = new Picture(rs.getInt(1), rs.getString(2), rs.getString(3));
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(picture);
		return picture;
	}
	
	@Override
	public Bucket addBucket(Bucket bucket) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, pass);
			conn.setAutoCommit(false); //Start transaction
			String sql = "INSERT INTO bucket (object_person, time_frame) VALUES ?, ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, bucket.getObjectPerson());
			stmt.setString(2, bucket.getTimeFrame());
			conn.commit(); // commit transaction
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			throw new RuntimeException("Error inserting bucket " + bucket);
		}
		return bucket;
	}
	
	@Override
	public Location addLocation(Location location) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, pass);
			conn.setAutoCommit(false); //Start transaction
			String sql = "INSERT INTO location (country_name, gps_coords, bucket_id) VALUES ?, ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, location.getCountry_name());
			stmt.setString(2, location.getGps_coords());
			stmt.setInt(3, location.getBucketId());			
			conn.commit(); // commit transaction
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			throw new RuntimeException("Error inserting location " + location);
		}
		return location;
	}
	
	@Override
	public Picture addPicture(Picture picture) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url);
			conn.setAutoCommit(false); // start transaction
			String sql = "INSERT INTO picture (url, description, bucket_id, location_id) VALUES ?,?,?,?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, picture.getUrl());
			stmt.setString(2, picture.getDescription());
			stmt.setInt(3, picture.getBucketId());
			stmt.setInt(4, picture.getLocationId());
			conn.commit(); // commit transaction
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			throw new RuntimeException("Error inserting picture " + picture);
		}
		return picture;
	}
	
	@Override
	public List<Bucket> createBucketList() {
		List<Bucket> bucketList = new ArrayList<>();
		try {
			Connection conn = DriverManager.getConnection(url, user, pass);
			String sql = "Select id, object_person, time_frame FROM bucket";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				bucketList.add(new Bucket(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bucketList;

	}
}
