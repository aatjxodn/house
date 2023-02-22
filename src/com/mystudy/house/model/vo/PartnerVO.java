package com.mystudy.house.model.vo;

public class PartnerVO {
	private String id, companyName, companyOwnerName, companyAddr, companyAddrDetail;
	private String companyPhone, companyEmail, crn, shipping;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyOwnerName() {
		return companyOwnerName;
	}

	public void setCompanyOwnerName(String companyOwnerName) {
		this.companyOwnerName = companyOwnerName;
	}

	public String getCompanyAddr() {
		return companyAddr;
	}

	public void setCompanyAddr(String companyAddr) {
		this.companyAddr = companyAddr;
	}

	public String getCompanyAddrDetail() {
		return companyAddrDetail;
	}

	public void setCompanyAddrDetail(String companyAddrDetail) {
		this.companyAddrDetail = companyAddrDetail;
	}

	public String getCompanyPhone() {
		return companyPhone;
	}

	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}

	public String getCompanyEmail() {
		return companyEmail;
	}

	public void setCompanyEmail(String companyEmail) {
		this.companyEmail = companyEmail;
	}

	public String getCrn() {
		return crn;
	}

	public void setCrn(String crn) {
		this.crn = crn;
	}

	public String getShipping() {
		return shipping;
	}

	public void setShipping(String shipping) {
		this.shipping = shipping;
	}

	@Override
	public String toString() {
		return "PartnerVO [id=" + id + ", companyName=" + companyName + ", companyOwnerName=" + companyOwnerName
				+ ", companyAddr=" + companyAddr + ", companyAddrDetail=" + companyAddrDetail + ", companyPhone="
				+ companyPhone + ", companyEmail=" + companyEmail + ", crn=" + crn + ", shipping=" + shipping + "]";
	}
	
	

}
