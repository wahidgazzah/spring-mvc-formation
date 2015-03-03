package com.dihaw.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dihaw.entity.Person;

@Controller
@RequestMapping("/persons")
public class PersonsController {
	
	private static String PERSON_LIST_VIEW = "view/persons/personList";
	private static String PERSONS_ATTRIBUTE = "persons";

	@RequestMapping("/list")
	public String viewPersons(Model model) {
		
		List<Person> persons = Person.createPersons();
		
		model.addAttribute(PERSONS_ATTRIBUTE, persons);
		return PERSON_LIST_VIEW;
		
	}
}
