package com.dihaw.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dihaw.entity.Gender;
import com.dihaw.entity.User;
import com.dihaw.services.CityService;
import com.dihaw.services.UsersService;
import com.dihaw.validators.ValidatorUserEntry;

@Controller
@RequestMapping("/users")
public class UsersController {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	public static final String USER_FORM_ATTRIBUTE = "user";
	public static final String RESULT_ATTRIBUTE = "result";
	public static final String CITY_MODEL_ATTRIBUTE = "cityList";
	public static final String GENDER_MODEL_ATTRIBUTE = "genderList";
	
	public static final String MAP = "map";
	
	private static String ADD_VIEW 	= "view/users/add";
	private static String LIST_VIEW = "view/users/list";
	private static String EDIT_VIEW = "view/users/edit";
	
	@Autowired
	private ValidatorUserEntry validatorUserEntry;

	@Autowired
	UsersService userService;
	
	@Autowired
	CityService cityService;
	
	@ModelAttribute(USER_FORM_ATTRIBUTE)
	public User registerUSerRequestForm() {
		return new User();
	}
	
	@ModelAttribute(GENDER_MODEL_ATTRIBUTE)
	public List<String> GenderModelAttribute() {
		
		List<String> genderList = new ArrayList<String>();
		genderList.add(Gender.F.getAbreviation());
		genderList.add(Gender.M.getAbreviation());

		return genderList;
	}
	
	@ModelAttribute(CITY_MODEL_ATTRIBUTE)
	public List<String> CityModelAttribute() {
		
		return cityService.getAllCityName();
	}
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	  public String showUsers(Model model,
	            @RequestParam(value = "page", required = false, defaultValue = "0") int page,
	            @RequestParam(value = "size", required = false, defaultValue = "5") int size) {
		
		logger.info("Showing Users view");
		
		PageRequest pageRequest = new PageRequest(page, size, Direction.ASC, "id");
		
	    model.addAttribute(RESULT_ATTRIBUTE, userService.users(pageRequest));
	    
	    return LIST_VIEW;
	  }

	@RequestMapping(value="/add", method = RequestMethod.GET)
	public String registerUser(Model model, ModelMap modelMap,
			@ModelAttribute(GENDER_MODEL_ATTRIBUTE) List<String> genderList, 
			@ModelAttribute(CITY_MODEL_ATTRIBUTE) List<String> cityList,
			@ModelAttribute(USER_FORM_ATTRIBUTE) User user, BindingResult bindingResult) {
		
		logger.info("Showing add user view");
		
		Errors errors = (Errors) modelMap.get("addErrors");
		
		if (errors != null) {
			bindingResult.addAllErrors(errors);
		}

		model.addAttribute(USER_FORM_ATTRIBUTE, new User());
		model.addAttribute(GENDER_MODEL_ATTRIBUTE, genderList);
		model.addAttribute(CITY_MODEL_ATTRIBUTE, cityList);
		
		return ADD_VIEW;
		
	}

	@RequestMapping(value = "/do-add", method = RequestMethod.POST)
	public String addUser(Model model,
			@ModelAttribute(GENDER_MODEL_ATTRIBUTE) List<String> genderList, 
			@ModelAttribute(CITY_MODEL_ATTRIBUTE) List<String> cityList,
			@Validated @ModelAttribute(USER_FORM_ATTRIBUTE) User user, 
			BindingResult bindingResult ) {
		
		validatorUserEntry.validate(user, bindingResult);
		
		if (bindingResult.hasErrors()) {
			
			model.addAttribute("addErrors", bindingResult);
			
			model.addAttribute(GENDER_MODEL_ATTRIBUTE, genderList);
			model.addAttribute(CITY_MODEL_ATTRIBUTE, cityList);
			
			return ADD_VIEW;
		}
		
		else{
//			userService.registerUser(user);
			return "redirect:/users";
		}
	}

	@RequestMapping(value="/edit", method = RequestMethod.GET)
	public String editUser(Model model, ModelMap modelMap,
			@ModelAttribute(GENDER_MODEL_ATTRIBUTE) List<String> genderList, 
			@ModelAttribute(CITY_MODEL_ATTRIBUTE) List<String> cityList,
			@RequestParam String id,
			@ModelAttribute(USER_FORM_ATTRIBUTE) User user,
			BindingResult bindingResult) {
		
		logger.info("Showing edit user view");
		
		Errors errors = (Errors) modelMap.get("editErrors");
		
		if (errors != null) {
			bindingResult.addAllErrors(errors);
		}
		
		user = userService.getUserById(Integer.parseInt(id));
		
		model.addAttribute(USER_FORM_ATTRIBUTE, user);
		model.addAttribute(GENDER_MODEL_ATTRIBUTE, genderList);
		model.addAttribute(CITY_MODEL_ATTRIBUTE, cityList);
		
		return EDIT_VIEW;

	}

	@RequestMapping(value="/do-edit", method = RequestMethod.POST)
	public String updateUser(Model model,
			@ModelAttribute(GENDER_MODEL_ATTRIBUTE) List<String> genderList, 
			@ModelAttribute(CITY_MODEL_ATTRIBUTE) List<String> cityList,
			@ModelAttribute(USER_FORM_ATTRIBUTE) User user,
			BindingResult bindingResult ) {
		
		logger.info("RequestMapping: /do-edit");
		
		if (bindingResult.hasErrors()) {
			
			model.addAttribute("editErrors", bindingResult);
			
			model.addAttribute(USER_FORM_ATTRIBUTE, user);
			model.addAttribute(GENDER_MODEL_ATTRIBUTE, genderList);
			model.addAttribute(CITY_MODEL_ATTRIBUTE, genderList);
			
			return EDIT_VIEW;
		}
		else{
			
			userService.updateData(user);
			return "redirect:/users/list";
		}
		
	}

	@RequestMapping("/delete")
	public String deleteUser(@RequestParam String id) {
		
		logger.info("RequestMapping: /delete");
		
//		userService.deleteData(id);
		
		return "redirect:/users";
	}
}