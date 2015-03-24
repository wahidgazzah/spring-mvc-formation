package com.dihaw.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dihaw.entity.Person;

@Controller
@RequestMapping(PersonsController.CONTROLLER_BASE_PATH)
public class PersonsController {
	
	public final static String CONTROLLER_BASE_PATH = "/persons";
	public final static String SELECT_PERSONS_SUB_PATH = "/list";
	
	private static String PERSONS_LIST_VIEW = "view/persons/personList";
	private static String PERSONS_ATTRIBUTE = "persons";

	@RequestMapping(SELECT_PERSONS_SUB_PATH)
	public String viewPersons(Model model) {
		
		List<Person> persons = Person.createPersons();
		
		model.addAttribute(PERSONS_ATTRIBUTE, persons);
		return PERSONS_LIST_VIEW;
		
	}
}
