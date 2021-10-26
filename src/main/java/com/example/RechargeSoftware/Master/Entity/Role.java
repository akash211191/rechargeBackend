package com.example.RechargeSoftware.Master.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.NamedNativeQueries;
import org.hibernate.annotations.NamedNativeQuery;

@NamedNativeQueries({
	@NamedNativeQuery(name = "Role.getAllRoleListExceptAdmin", query = "select * from Tbl_Role where role_name != 'Admin'")
})

@Entity
@Table(name= "Tbl_Role")
public class Role {
	
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)	
		@Column(name = "role_id")
		int roleId;
		
		@Column(name = "role_name")
		int roleName;

		public int getRoleId() {
			return roleId;
		}

		public void setRoleId(int roleId) {
			this.roleId = roleId;
		}

		public int getRoleName() {
			return roleName;
		}

		public void setRoleName(int roleName) {
			this.roleName = roleName;
		}
		
		
}
