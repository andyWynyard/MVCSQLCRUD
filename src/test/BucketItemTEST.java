package test;

import static org.junit.Assert.*;

import org.junit.Test;

import data.bucketItem;

public class BucketItemTEST {

	@Test
	public final void testGetWhat() {
		bucketItem item = new bucketItem("die", "die", "die");
		assertEquals("die", item.getWhat());
	}

	@Test
	public final void testSetWhat() {
		bucketItem item = new bucketItem("die", "die", "die");
		item.setWhat("notDie");
		assertEquals("notDie", item.getWhat());
	}

	@Test
	public final void testGetWhere() {
		bucketItem item = new bucketItem("die", "die", "die");
		assertEquals("die", item.getWhere());
	}

	@Test
	public final void testSetWhere() {
		bucketItem item = new bucketItem("die", "die", "die");
		item.setWhere("notDie");
		assertEquals("notDie", item.getWhere());
	}

	@Test
	public final void testGetWhen() {
		bucketItem item = new bucketItem("die", "die", "die");
		assertEquals("die", item.getWhen());
	}

	@Test
	public final void testSetWhen() {
		bucketItem item = new bucketItem("die", "die", "die");
		item.setWhen("notDie");
		assertEquals("notDie", item.getWhen());
	}

}
