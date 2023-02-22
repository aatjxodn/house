<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수집 및 이용동의</title>
<%@ include file="/WEB-INF/common/style.jspf"%>
<style>
.community, .store {
	color: black;
}

.home, .picture, .knowhow, .qna {
	color: black;
}

#tb tr th {
	background-color: Gainsboro;
	text-align: center;
}
#tb tr td {
	padding: 10px;
}
</style>
</head>
<body>
<div class="container">
	<%@ include file="/WEB-INF/common/guestMenu.jspf" %>
	<div class="pt-4">
			<p><b>수집하는 개인정보 항목 / 수집 및 이용목적 / 보유 및 이용기간</b></p>
			<table id="tb" border>
				<tr>	
					<th>수집방법</th>
					<th>수집항목</th>
					<th>수집 및 이용목적</th>
					<th>보유 및 이용기간</th>
				</tr>
				<tr>
					<td>회원가입</td>
					<td>(필수)닉네임, 이메일 주소, 비밀번호</td>
					<td>서비스 이용 및 상담, 환불 및 문의 회신, 서비스 개선을 위한 분석 등</td>
					<td rowspan="2">
						<b>회원탈퇴 및 목적달성 후 지체없이 삭제합니다.</b><br><br>
						단, 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령의 규정에 따라 
						거래 관계 확인을 위해 개인정보를 일정기간 보유 할 수 있습니다.<br><br>
						또한 부정이용 방지를 위하여 회원 탈퇴 후에도 구매 인증 시 입력한 정보는 6개월 동안 보관합니다.
					</td>
				</tr>
				<tr>
					<td>서비스 이용 과정에서 생성</td>
					<td>서비스 이용기록, 접속 로그, IP, 쿠키, 온라인식별자(광고ID, UUID 등), 단말기 정보(제조사, OS종류, 버전)</td>
					<td>이상행위 탐지 및 서비스 개선을 위한 분석, 이용자의 관심, 기호, 성향 추정을 통한 맞춤형 콘텐츠 및 서비스 제공</td>
				</tr>
			</table>
	</div>
	<div class="pt-5 pb-5">
			<p><b>동의를 거부할 권리 및 거부 경우의 불이익</b></p>
			귀하께서는 모두의집이 위와 같이 수집하는 개인정보에 대해 동의하지 않거나 개인정보를 기재하지 않음으로써
			거부할 수 있습니다. 다만, 이때 회원에게 제공되는 서비스가 제한될 수 있습니다.
	</div>
	<%@ include file="/WEB-INF/common/footer.jspf" %>
</div>
</body>
</html>