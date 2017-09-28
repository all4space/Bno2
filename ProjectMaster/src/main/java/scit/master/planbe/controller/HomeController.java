package scit.master.planbe.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:/users/loginForm";
	}
	
	@RequestMapping(value = "ourTeam", method = RequestMethod.GET)
	public String ourTeam() {
		return "ourTeam";
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
/*	
	@RequestMapping(value = "tasks", method = RequestMethod.GET)
	public String tasks() {
		return "redirect:/project/projectHistoryList";
	}*/
}
