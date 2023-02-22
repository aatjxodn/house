<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<%@ include file="/WEB-INF/common/style.jspf" %>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <style>
    
    body {
    	background-color: #F5F5F5;
    }

  .store {
  	color: black;
  }
  .community {
  	color: black;
  }
  .category, .home, .discount, .best {
  color: black;
  }
 
 .ship {
 	font-size: 0.8em;
 }
 
 .pname {
 	font-weight: bold;
 }
 
 .opt {
 	width: 100%;
 	border-radius: 10px;
 }
 
 .opt > th,td {
 	padding-top: 10px;
    padding-bottom: 10px;
 	padding-left: 30px;
    padding-right: 40px;
 }
 
 #total {
 	width: 100%;
 }
 
 #total th, #total td {
 	padding-top: 10px;
    padding-bottom: 10px;
 	padding-left: 10px;
    padding-right: 10px;
 }
 
 #lastP {
 	font-weight: bold;
 }
 
 #totalP {
 	font-size: 1.3em;
 }
 
  </style>
</head>
<body>

<div class="bg-white">
<div class="container">
<%@ include file="/WEB-INF/common/memberMenu.jspf" %></div>
</div>
<div class="container">
<div class="form-check">

<c:if test="${empty list}">
	<table style="text-align: center; width: 100%; height: 50%;">
		<tr>
			<td>
				<p><img alt="..." src="https://image.ohou.se/i/bucketplace-v2-development/uploads/assets/163703569663018673.png"></p>
				<p>
					<button type="button" class="btn btn-lg" id="btn" onclick="location.href='store.do'" style="width: 250px;">상품 담으러 가기</button>
				</p>
			</td>
		</tr>
	</table>
</c:if>

<c:if test="${not empty list}">
<br>
</div>

<div class="container">
			<div class="row">
				<div class="col-7">
<!-- ------------------카드코드시작------------------------- -->
<c:forEach var="vo" items="${list }" varStatus="status">
<div class="card">
  <ul class="list-group list-group-flush">
    <li class="list-group-item text-center">${vo.companyName } 배송</li>
    <li class="list-group-item">
    <table style="width: 100%;">
    	<tr>
    		<td style="vertical-align: top;"><p></p></td>
    		<td style="text-align: right; cursor: pointer;"><i class="bi bi-x-lg" data-toggle="modal" data-target="#exampleModal${status.index }"></i>

<!-- Modal -->
<div class="modal fade" id="exampleModal${status.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="padding: 30px;">
      <div class=" text-center">
        <p> 이 상품을 삭제하겠습니까?</p>
        <form action="cartDelete.do" method="post">
        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal" style="width: 100px;">취소</button>
        <input type="submit" class="btn" id="btn" value="삭제" style="width: 100px;">
        <input type="hidden" name="productNum" value="${vo.productNum}">
        </form>
        <br>
        </div>
    </div>
  </div>
</div>
    		
    		</td>
    	</tr>
    	<tr onclick="location.href='pdetail.do?productNum=${vo.productNum}'" style="cursor: pointer;">
    		<td style="padding: 0; text-align: center;"><img alt="상품이미지" src="${vo.imagefile}" width="100px;"></td>
    		<td><span class="pname">${vo.productName }</span></td>
    		<c:if test="${vo.shipping < vo.productPrice }">
    			<span class="ship">무료배송 | 일반택배</span>
    		</c:if>
    		<c:if test="${vo.shipping > vo.productPrice }">
    			<span class="ship">${vo.shipping }원 이상 무료배송 | 일반택배</span>
    		</c:if>
    	</tr>
    </table>
    <!-- 옵션 -->
    <table class="opt" style="background-color: #F5F5F5;">
    	<tr>
    		<td style="font-size: 0.8em;">${vo.productName }</td> <!-- 옵션명 -->
    		<td style="text-align: right; cursor: pointer;"><i class="bi bi-x-lg" data-toggle="modal" data-target="#exampleModal"></i>
    	</tr>
    	<tr>
    		<td> <select id="selectbox" name="cnt" onchange="chageLangSelect(${vo.productNum}, this.value, ${vo.stock}, ${vo.count })">
            <option value= ${vo.count } selected>${vo.count }</option>
            <option value= 1>1</option>
            <option value= 2>2</option>
            <option value= 3>3</option>
            <option value= 4>4</option>
            <option value= 5>5</option>
            <option value= 6>6</option>
            <option value= 7>7</option>
            <option value= 8>8</option>
            <option value= 9>9</option>
            <option value= 10>10</option>
        </select>
            </td>
    		<td style="text-align: right;"><span class="pname">${vo.totp}원</span></td><br>
    	</tr>
    </table>
    
    </li>
  
    
    <li class="list-group-item text-center">
    <c:if test="${vo.shipping < vo.totp }">
    	무료배송
    </c:if>
    <c:if test="${vo.shipping > vo.totp }">
    	<c:set var= "shipp" value="${shipp + 3000}"/>
    	배송비 3000원<br>
   		${vo.shipping - vo.totp }원 이상 추가시 무료배송
    </c:if>
    </li>
  </ul>
</div>
<br>


</c:forEach>

<!-- ---------------------카드코드끝---------------------- -->

</div>
<div class="col-5">
<div class="position-fixed">
<div class="card" style="width: 25rem;">
  <div class="card-body">
    <table id="total">
    	<tr>
    		<td>총 상품금액</td>
    		
    		<c:set var = "totalPrice" value = "0" />
    		<c:forEach var="vo" items="${list }">
			<c:set var= "totalPrice" value="${totalPrice + vo.totp}"/>
			</c:forEach>
			<!--<c:out value="${totalPrice}"/>-->
			
    		<td style="text-align: right;">${totalPrice}원</td>
    	</tr>
    	<tr>
    		<td>총 배송비</td>
    		<c:if test="${empty shipp}">
    		<td style="text-align: right;">0원</td>
    		</c:if>
    		<c:if test="${not empty shipp}">
    		<td style="text-align: right;">+ ${shipp}원</td>
    		</c:if>
    	</tr>
    	<tr id="lastP">
    		<td>결제금액</td>
    		<td id="totalP" style="text-align: right;">${totalPrice+shipp}원</td>
    	</tr>
    </table>
  </div>
</div>
<br>
<button type="button" class="btn btn-lg btn-block" id="btn" onclick="location.href='order.do'">${list.size() }개 상품 구매하기</button>
</div>
</div>
</div>
</div>
</c:if>
<br><br>
<%@ include file="/WEB-INF/common/footer.jspf" %>
</div>
</div>
<script>
	$(document).ready(function(){
		$('#allck').on('click', function(){
			if($(this).prop('checked')){
				$('#productck').prop("checked",true);
			}else{
				$('#productck').prop("checked",false);
			}
			
		});
	});
	
	
	//수량선택 수정
	function chageLangSelect(a , b, c, d){
    var langSelect = document.getElementById("selectbox");
     
    // select element에서 선택된 option의 value가 저장된다.
    var selectValue = langSelect.options[langSelect.selectedIndex].value;
 
    // select element에서 선택된 option의 text가 저장된다.
    var selectText = langSelect.options[langSelect.selectedIndex].text;
    
    console.log("selectText: " + b);
    console.log("productNum: " + a);
    
    if(b > c){
    	alert("구매가능 수량을 초과하였습니다😥");
    	return location.href ="cartChange.do?ProductNum="+a+"&count="+d;
    }
    
    
    location.href ="cartChange.do?ProductNum="+a+"&count="+b;
    
	}
	
</script>
</body>
</html>