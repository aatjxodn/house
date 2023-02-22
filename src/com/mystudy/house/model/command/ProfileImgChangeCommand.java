package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.MembersDAO;
import com.mystudy.house.model.vo.MembersVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProfileImgChangeCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String path = request.getSession().getServletContext().getRealPath("/img/profileImg");
		
		MultipartRequest mr = new MultipartRequest(
			request, //요청객체
			path, //실제 파일을 저장할 경로
			10 * 1024 * 1024, //업로드 파일의 최대크기 지정(byte 단위)
			"UTF-8", //인코딩 형식
			new DefaultFileRenamePolicy() //동일파일명 있으면 이름 자동 변경 처리
		);
		
		HttpSession session = request.getSession();
		
		MembersVO vo = new MembersVO();
		vo.setId((String) session.getAttribute("id"));
		vo.setProfileImg(mr.getFilesystemName("file"));
		
		MembersDAO.changeProfileImg(vo);

		session.setAttribute("profileImg", mr.getFilesystemName("file"));
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='infoEdit.do' method='post'>");
		out.println("</form></html>");
		out.println("<script>alert('프로필 이미지가 변경되었습니다');frm.submit();</script>");
		out.close();
		
		return null;
		
		// return "infoEdit.do";
	}

}
