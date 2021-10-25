package com.example.RechargeSoftware.Mapping.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Tbl_User_Role_Mapper")
public class UserRoleMapper {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userRoleMapperId;

	@Column(name = "role_id") 
	int roleId;
	
	@Column(name = "user_id")
	int userId;

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

		
	
	
}
