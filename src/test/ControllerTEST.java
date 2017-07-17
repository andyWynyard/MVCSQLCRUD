package test;

import static org.junit.Assert.*;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

public class ControllerTEST {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		public MockServletContext msc = new MockServletContext();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Test
	public final void testWelcome() {
		MockServletContext context = new MockServletContext();
		context.setContextPath("");
		this.object.setServletContext(context);
		fail("Not yet implemented"); // TODO
	}

	@Test
	public final void testAddToCSV() {
		fail("Not yet implemented"); // TODO
	}

	@Test
	public final void testDeleteFromCSV() {
		fail("Not yet implemented"); // TODO
	}

}
