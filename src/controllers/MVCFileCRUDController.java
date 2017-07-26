/**
 * 
 */
package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import data.Bucket;
import data.BucketDAOdb;
import data.Location;

/**
 * @author andyWynyard
 *
 */
@Controller
public class MVCFileCRUDController {

	@Autowired
	private BucketDAOdb bucketDAO;

	@RequestMapping(path = "view.do", method = RequestMethod.GET)
	public ModelAndView welcome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("view.jsp");
		List<Bucket> bucketList  = bucketDAO.createBucketList();
		mv.addObject("bucketList", bucketList);
		return mv;
	}


	@RequestMapping(path = "name.do", params = { "objectPerson", "location", "timeFrame" }, method = RequestMethod.POST)
	public ModelAndView addToBucket(@RequestParam("objectPerson") String objectPerson, @RequestParam("location") String location,
			@RequestParam("timeFrame") String timeFrame, RedirectAttributes redir) {
		Bucket bucket = new Bucket(objectPerson, timeFrame);
		bucket = bucketDAO.addBucket(bucket);
		Location local = new Location(location, bucket.getId());
		bucketDAO.addLocation(local);	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:view.do");
		List<Bucket> bucketList  = bucketDAO.createBucketList();
		redir.addFlashAttribute("bucketList", bucketList);
		return mv;
	}
	
	@RequestMapping(path = "details.do", params = "bucketId", method = RequestMethod.GET)
	public ModelAndView detailedView(@RequestParam("bucketId") int bucketId) {
		System.out.println(bucketId);
		Bucket bucket = bucketDAO.getBucketById(bucketId);	
		Location local = bucketDAO.getLocationByBucketId(bucketId);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("details.jsp");
		mv.addObject("location", local);
		mv.addObject("bucket", bucket);
		return mv;
		
	}
	

//	@RequestMapping(path = "delete.do", params = "checkDelete", method = RequestMethod.POST)
//	public ModelAndView deleteFromCSV(@RequestParam("checkDelete") String value, RedirectAttributes redir) {
//		System.out.println(value);
//
//		String removed = bucketDAO.deletebucketItem(value);
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("redirect:view.do");
//		redir.addFlashAttribute("bucketList", bucketDAO.getBucket());
//		redir.addFlashAttribute("removed", removed);
//		return mv;
//		
//	}
}
