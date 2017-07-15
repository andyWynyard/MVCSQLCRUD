/**
 * 
 */
package data;

/**
 * @author andyWynyard
 *
 */
public class bucketItem {
	private String what;
	private String where;
	private String when;
	public String getWhat() {
		return what;
	}
	
	
	public bucketItem(String what, String where, String when) {
		super();
		this.what = what;
		this.where = where;
		this.when = when;
	}


	public void setWhat(String what) {
		this.what = what;
	}
	public String getWhere() {
		return where;
	}
	public void setWhere(String where) {
		this.where = where;
	}
	public String getWhen() {
		return when;
	}
	public void setWhen(String when) {
		this.when = when;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("bucketItem [what=");
		builder.append(what);
		builder.append(", where=");
		builder.append(where);
		builder.append(", when=");
		builder.append(when);
		builder.append("]");
		return builder.toString();
	}

}


