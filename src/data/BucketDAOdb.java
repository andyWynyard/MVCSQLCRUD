package data;

import java.util.List;

public interface BucketDAOdb {

	Bucket getBucketById(int id);

	Location getLocationById(int id);

	Picture getPictureById(int id);

	Bucket addBucket(Bucket bucket);

	Location addLocation(Location location);

	Picture addPicture(Picture picture);

	List<Bucket> createBucketList();

	Location getLocationByBucketId(int id);

}
