package com.dihaw.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "USERS")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	private int id;
	
	@Column(name = "FIRST_NAME")
	@NotBlank
	@Size(min = 3, max = 10)
	private String firstName;

	@Column(name = "LAST_NAME")
	@NotBlank
	@Size(min = 3, max = 10)
	private String lastName;

	@Column(name = "EMAIL")
	@NotBlank
	@Size(min = 5, max = 30)
	private String email;
	
	@Column(name = "PASSWORD")
	@NotBlank
	@Size(min = 5, max = 10)
	private String password;

    @Enumerated(EnumType.STRING)
    @Column(name = "GENDER")
    private Gender gender;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "STATUS")
    private UserStatus status;
    
    @ManyToOne(optional = true)
    @JoinColumn(name = "CITY_ID")
	private City city;
    
	@Column(name = "CREATION_DATE")
	private Date creationDate;
	
	@Column(name = "LAST_CONNECTION")
	private Date lastConnection;
	
    /**
     * Protected constructor for ORM.
     */
	public User() {
    }
    
    public User(String firstName, String lastName, 
    			String email, String password,
    			Gender gender, UserStatus status,
    			City city ){
    	
    	this.firstName = firstName;
    	this.lastName = lastName;
    	this.email = email;
    	this.password = password;
    	this.gender=gender;
    	this.status = status;
    	this.city=city;
    	
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public UserStatus getStatus() {
		return status;
	}

	public void setStatus(UserStatus status) {
		this.status = status;
	}

	public Date getLastConnection() {
		return lastConnection;
	}

	public void setLastConnection(Date lastConnection) {
		this.lastConnection = lastConnection;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	
}