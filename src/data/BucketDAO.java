/**
 * 
 */
package data;

import java.util.List;

/**
 * @author andyWynyard
 *
 */
public interface BucketDAO {
	public void addBucketItem(String what, String where, String when);
	public String deletebucketItem(String what);
	public bucketItem getBucketItem();	
	public List<bucketItem> getBucket();

	void persistThing();
	/**
	 * @param b
	 */
	void persistThing(List<bucketItem> b);

}
