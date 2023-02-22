<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
<head>
<c:forEach var="vo" items="${list }">
<meta charset="UTF-8">
<title>${vo.productName }</title>
<%@ include file="/WEB-INF/common/style.jspf" %>
<style>

 .store {
  	color: #35C5F0;
  	font-weight: bold;
  }
  .community {
  	color: black;
  }
  .best {
  	color: #35C5F0;
  	font-weight: bold;
  }
  .category, .home, .discount {
  color: black;
  }

.company {
	font-size: 0.8em;
}

.p_name {
	font-size: 1.3em;
	font-weight: bold;
	color: black;
}

.p_price {
	font-size: 2.5em;
	font-weight: bold;
	color: black;
}

.p_pricen {
	font-size: 2em;
	color: black;
}

.cate {
	font-size: 0.9em;
	color: gray;
}

.nav2 {
	height: 500px;
}

h5 {
	font-weight: bold;
}


</style>
</head>
<body>
	
	<div class="container">
	<c:if test="${empty id }">
		<%@ include file="/WEB-INF/common/guestMenu.jspf" %>
	</c:if>
	<c:if test="${not empty id }">
		<%@ include file="/WEB-INF/common/memberMenu.jspf" %>
	</c:if>
	<br>
	<div class="cate">
		<a href="category.do?categoryNum=${vo.categoryNum}" style="color: black;">${vo.categoryName }</a> 
		<i class="bi bi-chevron-right"></i>
		<a href="categorydt.do?categoryNum=${vo.categoryNum }&categoryDetail=${vo.categoryDetail}" style="color: black;"> ${vo.categoryDetail }</a><br>
		<br>
	</div>
		<div class="container mx-auto">
			<div class="row">
				<div class="col-6">

					<img
						src="${vo.imagefile }"
						alt="제품사진" width="80%" style="border-radius: 5%;">
				</div>

				<div class="col-6">
					<a class="company" href="#">${vo.companyName }</a>
					<!-- 회사이름 -->
					<p class="p_name">${vo.productName }</p>
					<!-- 제품명 -->
					<c:if test="${vo.stock == 0 }">
					<span class="p_price" style="font-size: 1.3em;"> 일시품절 </span>
					</c:if>
					<c:if test="${vo.stock != 0 }">
					<span class="p_price"> <fmt:formatNumber value="${vo.productPrice }" pattern="#,###" /> </span>
					<span class="p_pricen"> 원</span>
					</c:if>
					<c:if test="${vo.shipping < vo.productPrice }">
						<span class="badge badge-secondary">무료배송</span>
					</c:if>
					<span class="badge badge-danger">최저가 도전</span> <br>
					<span>혜택</span> &nbsp;&nbsp;
					<span>
					<fmt:parseNumber value="${Math.ceil(vo.productPrice*0.001)}" integerOnly="true" />P 적립 (WELCOME 0.1% 적립)
					</span> <br> 
					<span>배송</span> &nbsp;&nbsp;
					<c:if test="${vo.shipping < vo.productPrice }">
					<span>무료배송</span><br>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:if test="${vo.shipping > vo.productPrice }">
					<span>3000원</span><br>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:if>
					<span>(제주도/도서산간 지역 5,000원)</span><br>
					<hr>
					
					
					<!-- ================== -->
			<div class="content_right">

  <c:if test="${vo.stock != 0 }">
      <div class="qty">					
        <span class="minus"><a href="javascript:change_qty2('m')"><input type="button" value="-" style="border: none;"></a></span>
        <input type="text" class="ct_qty" id="ct_qty" value="1" readonly="readonly" style="border: none; background-color: #F6F6F6;">
        <span class="plus"><a href="javascript:change_qty2('p')"> <input type="button" value="+" style="border: none;"></a></span>
      </div>	
  	
  	<br>
    <span style="font-size: 0.9em; font-weight: bold;">주문금액</span>
    <span class="total_amount" style="font-size: 1.5em; font-weight: bold; padding-left: 60%;"><fmt:formatNumber value="${vo.productPrice }" pattern="#,###" /></span>
    <span style="font-size: 1.1em; font-weight: bold;">원</span>
 </c:if>   
</div>

<script>
Number.prototype.format = function(){
  if(this==0) return 0;

  var reg = /(^[+-]?\d+)(\d{3})/;
  var n = (this + '');

  while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

  return n;
};
 

String.prototype.format = function(){
  var num = parseFloat(this);
  if( isNaN(num) ) return "0";

  return num.format();
};
    
var basic_amount = parseInt('${vo.productPrice }');

function change_qty2(t){
  //var min_qty = '수량버튼'*1;
  var min_qty = 1;
  var this_qty = $("#ct_qty").val()*1;
  var max_qty = '${vo.stock }'; // 현재 재고
  if(t=="m"){
    this_qty -= 1;
    if(this_qty<min_qty){
      //alert("최소구매수량 이상만 구매할 수 있습니다.");
      //alert("수량은 1개 이상 입력해 주십시오.");
      return;
      }
    }
    else if(t=="p"){
      this_qty += 1;
      if(this_qty>max_qty){
        alert("구매가능 수량을 초과하였습니다😥");
        return;
        }
    }

  var show_total_amount = basic_amount * this_qty;
  //$("#ct_qty_txt").text(this_qty); 
  $(".ct_qty").val(this_qty);
  $("#it_pay").val(show_total_amount);
  $(".total_amount").html(show_total_amount.format());
  
  $(".count").val(this_qty);
}


	function CartInsert() {
		<c:if test="${empty id }">
		alert('주문하시려면 로그인하세요');
		return false;
		history.back();
		</c:if>
		<c:if test="${not empty id}">
		$('#frmm').submit();
		</c:if>
	}
	
	function OrderNow() {
		<c:if test="${empty id }">
		alert('주문하시려면 로그인하세요');
		return false;
		history.back();
		</c:if>
		<c:if test="${not empty id}">
		$('#ordernow').submit();
		</c:if>
	}
	
	
	
	

</script>
					<!-- 여기수정중 -->
					<c:if test="${vo.stock == 0 }">
					<button type="button" class="btn btn-secondary btn-lg" disabled style="width: 500px;">품절되었습니다</button>
					</c:if>
					
					<c:if test="${vo.stock != 0 }">
					<form id="frmm" action="goCartInsert.do" method="post" style="display: inline;">
					<input type="hidden" name="id" value="${id}">
					<input type="hidden" name="id" value="${id}">
					<input type="hidden" name="ProductNum" value="${vo.productNum}">
					<input class="count" type="hidden" name="count" value="1"> <!-- count값 수정 -->
					<input type="button" class="btn btn-outline-secondary btn-lg" style="width: 250px;" value="장바구니" onclick="CartInsert()">
					</form>
					<form id="ordernow" action="orderOne.do" method="post" style="display: inline;">
					<input type="hidden" name="id" value="${id}">
					<input class="count" type="hidden" name="count" value="1">
					<input type="hidden" name="imagefile" value="${vo.imagefile}">
					<input type="hidden" name="productNum" value="${vo.productNum}">
					<input type="hidden" name="productPrice" value="${vo.productPrice}">
					<input type="hidden" name="productName" value="${vo.productName}">
					<input type="hidden" name="shipping" value="${vo.shipping}">
					<input type="hidden" name="stock" value="${vo.stock}">
					<input type="hidden" name="companyName" value="${vo.companyName}">
					<input type="button" class="btn btn-lg" id="btn" style="width: 250px;" value="바로구매" onclick="OrderNow()">
					</form>
					</c:if>
				</div>
			</div>
		</div>
	<hr>
	<ul id="nav2" class="nav justify-content-center">
		<li class="nav-item">
		<a class="nav-link" href="#info" style="color: black; font-size: 1.1em; font-weight: bold;">
		상품정보</a>
		</li>
		<li class="nav-item">
		<a class="nav-link" href="#rev" style="color: black; font-size: 1.1em; font-weight: bold;">
		리뷰</a>
		</li>
		<li class="nav-item">
		<a class="nav-link" href="#qa" style="color: black; font-size: 1.1em; font-weight: bold;">
		문의</a>
		</li>
		<li class="nav-item">
		<a class="nav-link" href="#partner" style="color: black; font-size: 1.1em; font-weight: bold;">
		판매자정보</a>
		</li>
	</ul>
	<hr>


<div class="container">
<div class="row">
<div class="col-9">




	<div class="p_dt">
	<p class="p_name"><a name="info"></a>상품정보</p>
	<img alt="상품정보" src="${vo.productInfo }" width="80%">
	</div>
	
	
	
	
	
	<br>
	<p class="p_name"><a name="rev"></a>리뷰</p>
	
	<form action="review_product_inquiry.jsp" method="post">
	<input type="submit" class="btn" id="btn" style="width: 100%; font-weight: bold;" value="해당상품 리뷰로 이동">
	<input type="hidden" name="productNum" value="${vo.productNum }">
	</form>
		
	<br><br>
	<p class="p_name"><a name="qa"></a>문의</p>
	
	<form action="review_product_inquiry.jsp" method="post">
	<input type="submit" class="btn" id="btn" style="width: 100%; font-weight: bold;" value="해당상품 문의로 이동">
	<input type="hidden" name="productNum" value="${vo.productNum }">
	</form>
	
	<br><br>
	<p class="p_name"><a name="partner"></a>판매자정보</p>
	
	<table class="table" style="font-size: 0.9em; color: gray;">
  <tbody>
    <tr>
      <th scope="row">상호</th>
      <td>${vo.companyName }</td>
    </tr>
    <tr>
      <th scope="row">사업장소재지</th>
      <td>${vo.companyAddr }</td>
    </tr>
    <tr>
      <th scope="row">고객센터 전화번호</th>
      <td>${vo.companyPhone }</td>
    </tr>
    <tr>
      <th scope="row">이메일</th>
      <td>${vo.companyEmail }</td>
    </tr>
    <tr>
      <th scope="row">사업자 등록번호</th>
      <td>${vo.crn }</td>
    </tr>
  </tbody>
</table>
	
</div>


<!-- 따라오는 장바구니 -->
<div class="col-3">
<div class="position-fixed">
<div class="card" style="width: 260px;">
  <div class="card-body">
    
<div class="qty">					
        <span class="minus"><a href="javascript:change_qty2('m')"><input type="button" value="-" style="border: none;"></a></span>
        <input type="text" class="ct_qty" id="ct_qty" value="1" readonly="readonly" style="width: 50%; border: none; background-color: #F6F6F6;">
        <span class="plus"><a href="javascript:change_qty2('p')"> <input type="button" value="+" style="border: none;"></a></span>
      </div>	
  	
  	<br>
    <span style="font-size: 0.9em; font-weight: bold;">주문금액</span><br>
    <span class="total_amount" style="font-size: 1.5em; font-weight: bold; padding-left: 35%;"><fmt:formatNumber value="${vo.productPrice }" pattern="#,###" /></span>
    <span style="font-size: 1.1em; font-weight: bold;">원</span>    
    
    
    
  </div>
</div>
<br>
<c:if test="${vo.stock == 0 }">
	<button type="button" class="btn btn-secondary btn-lg" disabled style="width: 260px;">품절되었습니다</button>
</c:if>
<c:if test="${vo.stock != 0 }">
<form action="goCartInsert.do" method="post" style="display: inline;">
	<input type="hidden" name="id" value="${id}">
	<input type="hidden" name="ProductNum" value="${vo.productNum}">
	<input class="count" type="hidden" name="count"> <!-- count값 수정 -->
	<input type="button" class="btn btn-outline-secondary" style="width: 130px;" value="장바구니" onclick="CartInsert()">
</form>
<!-- 바로구매 -->
<form action="order.do" method="post" style="display: inline;">
	<input type="hidden" name="id" value="${id}">
	<input class="count" type="hidden" name="count" value="1">
	<input type="hidden" name="imagefile" value="${vo.imagefile}">
	<input type="hidden" name="productNum" value="${vo.productNum}">
	<input type="hidden" name="productPrice" value="${vo.productPrice}">
	<input type="hidden" name="productName" value="${vo.productName}">
	<input type="hidden" name="shipping" value="${vo.shipping}">
	<input type="hidden" name="stock" value="${vo.stock}">
	<input type="hidden" name="companyName" value="${vo.companyName}">
	<input type="button" class="btn" id="btn" style="width: 130px;" value="바로구매" onclick="OrderNow()">
	</form>
</c:if>
</div>

</div>

</div>
</div>	
	
	<%@ include file="/WEB-INF/common/footer.jspf"%>
	</div>
</c:forEach>	
</body>
</html>