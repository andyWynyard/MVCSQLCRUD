package test;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import data.BucketDAO;
import data.BucketDAOImpl;

public class BucketDAOImplTEST {
	public static BucketDAO testDAO;
	
	@Autowired
	public static void setTestDAO(BucketDAO testDAO) {
		BucketDAOImplTEST.testDAO = testDAO;
	}

	@Before
	public void setUpBeforeClass() throws Exception {
		testDAO = new BucketDAOImpl();
	}

	@After
	public void tearDownAfterClass() throws Exception {
		testDAO = null;
	}

	@Test
	public final void testInit() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public final void testAddBucketItem() {
		testDAO.addBucketItem("this", "that", "theother");
		assertEquals(testDAO.getBucketItem().getWhat(), "this");
	}

	@Test
	public final void testDeletebucketItem() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public final void testGetBucketList() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public final void testGetBucket() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public final void testGetBucketItem() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public final void testPersistThingListOfbucketItem() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public final void testPersistThing() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public final void testMain() {
		fail("Not yet implemented"); // TODO
	}

}
