/**
 * 
 */
package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author andyWynyard
 *
 */
@Controller
public class MVCFileCRUDController {
	@RequestMapping("view.do")
	public String welcome() {
	    return("view.jsp");
	  }
	
	
	@RequestMapping("name.do")
	  public ModelAndView nameData(@RequestParam("name") String s) {
		
	    String awe = s.concat(" , Duke of Westminster");
	    ModelAndView mv2 = new ModelAndView();
	    mv2.setViewName("view.jsp");
	    mv2.addObject("newName", awe);
	    return mv2;
	}
}
