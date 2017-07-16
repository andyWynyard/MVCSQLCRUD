/**
 * 
 */
package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import data.BucketDAO;

/**
 * @author andyWynyard
 *
 */
@Controller
public class MVCFileCRUDController {

	@Autowired
	private BucketDAO bucketDAO;

	@RequestMapping(path = "view.do", method = RequestMethod.GET)
	public ModelAndView welcome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("view.jsp");
		mv.addObject("bucketList", bucketDAO.getBucket());
		return mv;
	}

	@RequestMapping(path = "name.do", params = { "what", "where", "when" }, method = RequestMethod.POST)
	public ModelAndView addToCSV(@RequestParam("what") String what, @RequestParam("where") String where,
			@RequestParam("when") String when, RedirectAttributes redir) {

		bucketDAO.addBucketItem(what, where, when);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:view.do");
		redir.addFlashAttribute("bucketList", bucketDAO.getBucket());
		return mv;
	}
	
	@RequestMapping(path = "delete.do", params = "checkDelete", method = RequestMethod.POST)
	public ModelAndView deleteFromCSV(@RequestParam("checkDelete") String value, RedirectAttributes redir) {
		System.out.println(value);

		String removed = bucketDAO.deletebucketItem(value);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:view.do");
		redir.addFlashAttribute("bucketList", bucketDAO.getBucket());
		redir.addFlashAttribute("removed", removed);
		return mv;
		
	}

}
