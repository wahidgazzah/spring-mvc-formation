package com.dihaw.entity;

public enum UserRole {

	ROLE_ADMIN,
	ROLE_USER,
	ROLE_GUEST;
	
    public String value() {
        return name();
    }

    public static UserRole fromValue(String v) {
        return valueOf(v);
    }

}
