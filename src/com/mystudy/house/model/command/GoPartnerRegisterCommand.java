package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.PartnerDAO;
import com.mystudy.house.model.vo.PartnerVO;

public class GoPartnerRegisterCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		PartnerVO vo = new PartnerVO();
		vo.setId((String) session.getAttribute("id"));
		vo.setCompanyName(request.getParameter("companyName"));
		vo.setCompanyOwnerName(request.getParameter("companyOwnerName"));
		vo.setCompanyAddr(request.getParameter("companyAddr"));
		vo.setCompanyAddrDetail(request.getParameter("companyAddrDetail"));
		vo.setCompanyPhone(request.getParameter("companyPhone"));
		vo.setCompanyEmail(request.getParameter("companyEmail"));
		vo.setCrn(request.getParameter("crn"));
		vo.setShipping(request.getParameter("shipping"));

		int result = PartnerDAO.registerPartner(vo);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		java.io.PrintWriter out = response.getWriter();
		if(result > 0) {
			out.println("<html><form name='frm' action='community.do' method='post'>");
			out.println("</form></html>");
			out.println("<script>alert('판매자 신청이 완료되었습니다');frm.submit();</script>");
		} else {
			out.println("<html><form name='frm' action='partnerRegister.do' method='post'>");
			out.println("</form></html>");
			out.println("<script>alert('판매자 신청 실패했습니다');frm.submit();</script>");
		}
		out.close();

		return null;
	}

}
