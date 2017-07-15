/**
 * 
 */
package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.BucketDAO;

/**
 * @author andyWynyard
 *
 */
@Controller
public class MVCFileCRUDController {
	
	@Autowired
	private BucketDAO bucketDAO;
	
	@RequestMapping("view.do")
	public ModelAndView welcome() {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("view.jsp");
		mv.addObject("bucketList", bucketDAO.getBucket());
	    return mv;
	  }
	
	
	@RequestMapping("name.do")
	  public ModelAndView nameData(@RequestParam("what") String s) {
		
	    String awe = s.concat(" , Duke of Westminster");
	    ModelAndView mv2 = new ModelAndView();
	    mv2.setViewName("view.jsp");
	    mv2.addObject("newName", awe);
	    return mv2;
	}
}
