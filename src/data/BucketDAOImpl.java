/**
 * 
 */
package data;

import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;


/**
 * @author andyWynyard
 *
 */
public class BucketDAOImpl implements BucketDAO {


		private static String url = "jdbc:mysql://localhost:3306/bucket_list_db";
		private String user = "bucketuser";
		private String pass = "bucketuser";

		public BucketDAOImpl() {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				System.err.println("Error loading MySQL Driver!!!");
			}
		}
	
	
	
	@Autowired 
	private WebApplicationContext wac;

	/*
	 * The @PostConstruct method is called by Spring after 
	 * object creation and dependency injection
	 */
	@PostConstruct
	public void init() {
		// Retrieve an input stream from the servlet context
		// rather than directly from the file system
		try (
				InputStream is = wac.getServletContext().getResourceAsStream(FILE_NAME);
				BufferedReader buf = new BufferedReader(new InputStreamReader(is));
			) {
			String line = buf.readLine();
			while ((line = buf.readLine()) != null) {
				String[] tokens = line.split(", ");
				String what = tokens[0];
				String where = tokens[1];
				String when = tokens[2];
		
				bucketList.add(new bucketItem(what, where, when));
			}
		} catch (Exception e) {
			System.err.println(e);
		}
	}
	

	/* (non-Javadoc)
	 * @see data.BucketDAO#addBucketItem(java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public void addBucketItem(String what, String where, String when) {
		bucketList.add(new bucketItem(what, where, when));
		persistThing(bucketList);
		
		

	}

	/* (non-Javadoc)
	 * @see data.BucketDAO#deletebucketItem(int)
	 */
	@Override
	public String deletebucketItem(String what) {
		bucketItem b = null;
		for (bucketItem bucketItem : bucketList) {
			if(bucketItem.getWhat().equals(what)){
				b = bucketItem;
				break;
			}
		}
		int index = bucketList.indexOf(b);
		String removed = bucketList.remove(index).toString() + " has been removed";
		persistThing(bucketList);
		removed = "What: " + b.getWhat() + ", Where: " + b.getWhere() + ", When: " + b.getWhen();
		return removed;
	}


	public List<bucketItem> getBucketList() {
		return bucketList;
	}


	/* (non-Javadoc)
	 * @see data.BucketDAO#getBucket()
	 */
	@Override
	public List<bucketItem> getBucket() {
		return bucketList;
		
	}


	/* (non-Javadoc)
	 * @see data.BucketDAO#getBucketItem()
	 */
	@Override
	public bucketItem getBucketItem() {
		// TODO Auto-generated method stub
		return null;
	}


//	public void setBucketList(List<bucketItem> bucketList) {
//		this.bucketList = bucketList;
//	}
//	
	
	 @Override
	    public void persistThing(List<bucketItem> b) {
	        String orderFile = "WEB-INF/bucket.csv";
	        String filePath = wac.getServletContext().getRealPath(orderFile);
	        System.out.println(filePath);
	        try {
	            PrintWriter out = new PrintWriter(new FileWriter(filePath));
	            	for (bucketItem bucketItem : b) {
						out.println(bucketItem.getWhat() + ", " + bucketItem.getWhere() + ", " + bucketItem.getWhen());
					}
	            	out.close();
	        }
	        catch (IOException ioe) {
				ioe.getMessage();
			}
	 }


	/* (non-Javadoc)
	 * @see data.BucketDAO#persistThing()
	 */
	@Override
	public void persistThing() {
		// TODO Auto-generated method stub
		
	}
	
	public static void main(String[] args) {
		System.out.println("This is a test");
	}


	
}
