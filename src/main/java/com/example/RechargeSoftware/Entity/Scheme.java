package com.example.RechargeSoftware.Entity;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.NamedNativeQueries;
import org.hibernate.annotations.NamedNativeQuery;



@NamedNativeQueries({
	@NamedNativeQuery(name = "Scheme.getAllSchemeList", query = "select s.*,r.role_name from Tbl_Scheme s "
			+ "join Tbl_Role r on s.role_id = r.role_id and s.scheme_id != 6"),
	@NamedNativeQuery(name = "Scheme.getSchemeListById", query = "select s.*,r.role_name from Tbl_Scheme s " 
			+ "join Tbl_Role r on s.role_id = r.role_id where scheme_id =:schemeId"),
	@NamedNativeQuery(name = "Scheme.getSchemeForRole", query = "select s.scheme_id,s.scheme_name from Tbl_Scheme s where role_id =:roleId "),
	@NamedNativeQuery(name = "Scheme.getSchemeUnderRole", query = "select s.scheme_id,s.scheme_name,s.role_id "
			+ "from Tbl_Scheme s join Tbl_Role r on s.role_id = r.role_id where r.under_role_id =:roleId"),
	@NamedNativeQuery(name = "Scheme.getAmountUnderScheme", query = "select scheme_amount "
			+ "from Tbl_Scheme where scheme_id =:schemeId"),
})

@Entity
@Table(name = "Tbl_Scheme")
public class Scheme {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "scheme_id")
	int schemeId;
	
	@Column(name = "scheme_name")
	String schemeName;
	 
	@Column(name = "scheme_description")
	String schemeDescription;
	
	@Column(name = "status")
	char status;
	
	@Column(name = "scheme_amount")
	double schemeAmount;
	
	@Column(name = "is_default")
	char isDefault;
	
	@Column(name = "created_date")
	Date createdDate;
	
	@Column(name = "role_id")
	int roleId;
	
	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getSchemeId() {
		return schemeId;
	}

	public void setSchemeId(int schemeId) {
		this.schemeId = schemeId;
	}

	public String getSchemeName() {
		return schemeName;
	}

	public void setSchemeName(String schemeName) {
		this.schemeName = schemeName;
	}

	public String getSchemeDescription() {
		return schemeDescription;
	}

	public void setSchemeDescription(String schemeDescription) {
		this.schemeDescription = schemeDescription;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public double getSchemeAmount() {
		return schemeAmount;
	}

	public void setSchemeAmount(double schemeAmount) {
		this.schemeAmount = schemeAmount;
	}

	public char getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(char isDefault) {
		this.isDefault = isDefault;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	
}