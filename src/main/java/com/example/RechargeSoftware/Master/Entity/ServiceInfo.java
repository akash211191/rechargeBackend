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
	@NamedNativeQuery(name = "Service.getAllServiceList", query = "select service_id as serviceId,service_name as serviceName from Tbl_Service")
})


@Entity
@Table(name = "Tbl_Service")
public class ServiceInfo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "service_id")
	int serviceId;
	
	@Column(name = "service_name")
	String serviceName;

	public int getServiceId() {
		return serviceId;
	}

	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
}
