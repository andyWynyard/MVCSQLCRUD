/**
 * 
 */
package data;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
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
	
	private static final String FILE_NAME="/WEB-INF/bucket.csv";
	private List<bucketItem> bucketList = new ArrayList<>();
	/*
	 * Use Autowired to have Spring inject an instance
	 * of a WebApplicationContext into this object after
	 * creation.  We will use the WebApplicationContext to
	 * retrieve an ServletContext so we can read from a 
	 * file.
	 */
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

	}

	/* (non-Javadoc)
	 * @see data.BucketDAO#deletebucketItem(int)
	 */
	@Override
	public String deletebucketItem(int id) {
		return bucketList.remove(id).toString() + " has been removed";	
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
	

}
