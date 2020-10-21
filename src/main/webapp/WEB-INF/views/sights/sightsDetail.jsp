<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

	<%@ include file="/WEB-INF/views/template/head.jspf" %>
	
  <title>Full Width Pics - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <!-- 
  <link href="${root }/resources/css/bootstrap.min.css" rel="stylesheet">
   -->

  
 <style type="text/css">
 body {
  padding-top: 56px;
}

.bg-image-full {
  background: no-repeat center center scroll;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  background-size: cover;
  -o-background-size: cover;
}  

 	body > div > div > div.col-md-10.col-md-offset-1 > div > div.row > a,
 		body > div > div > div.col-md-10.col-md-offset-1 > div > div.row > form > button {
		color: #593196;
		border: 1px solid #cfcfe0;
		font-size: inherit;
	}
	
	body > div > div > div.col-md-10.col-md-offset-1 > div > div.row > a {
		display: -webkit-box;
    	position: relative;
    	left: 2%;
	}

	body > div > div > div.col-md-10.col-md-offset-1 > div > div.row > form > button {
		display: -webkit-box;
    	position: relative;
    	left: 40%;
	}


</style>  

</head>

<body>
	<%@ include file="/WEB-INF/views/template/nav.jspf" %>
	<%@ include file="/WEB-INF/views/template/header.jspf" %>


  <!-- Header - set the background image for the header in the line below -->
  <header class="py-5 bg-image-full" style="background-image: url('https://images.france.fr/zeaejvyq9bhj/4jKuK6yobYMkGGQ4IO0Kk2/b77683922a8cca16afaa0d2028df39ad/savoie-mont-blanc-ete-header.jpg?w=1120&h=490&q=70&fl=progressive&fit=fill');">
    <img class="img-fluid d-block mx-auto" src="https://images.cdn1.stockunlimited.net/clipart/snow-capped-mountains_1976279.jpg" alt="">
  </header>

  <!-- Content section -->
  <section class="py-5">
    <div class="container">
      <h1> ${bean.title } </h1>
      <p class="lead"> ${bean.sightsContent }</p>
      <p>산수화로 겸재 정선의 《인왕제색도》(국보 제216호)가 유명하다. 뒤쪽엔 서대문형무소가 있고 앞쪽에는 경복궁이있다</p>
    </div>
  </section>

  <!-- Image element - set the background image for the header in the line below -->
  <div class="py-5 bg-image-full" style="background-image: url('https://res.klook.com/image/upload/c_fill,w_960,h_460,f_auto/w_80,x_15,y_15,g_south_west,l_klook_water/activities/d8z2rd1abindhcko27nk.jpg');">
    <!-- Put anything you want here! There is just a spacer below for demo purposes! -->
    <div style="height: 200px;"></div>
  </div>

  <!-- Content section -->
  <section class="py-5">
    <div class="container">
      <h1></h1>
      <p class="lead">백패킹을 즐기는 방법은 어렵지 않습니다. 우선 배낭 하나 둘러메고 떠날 마음의 여유부터 가져보는 게 첫 번째 단계입니다. 처음부터 많은 장비를 마련하려다보면 장비의 무게에 밀려, 정작 내가 왜 백패킹을 하려 했는지 잊게 될 수 있으니까요. 나의 체력에 맞는 코스부터 차근차근 가벼운 마음으로 자연 속으로 다가간다면 계절은 두 팔 벌려 우리를 반겨줄 거랍니다.</p>      
    </div>
  </section>


	<div class="row">
     	<c:if test="${user != null}">
        	<c:if test="${user.grade == 1}">	
 			
 				<a href="./${bean.sightsNo }/edit" class="btn btn-default" role="btn">수 정</a>

		<form method="post">
			<input type="hidden" name="_method" value="delete">
			<button type="submit" class="btn btn-default">삭 제</button>
		</form>
 
 			</c:if>
		</c:if>
	</div>
 
 
  <!-- Bootstrap core JavaScript -->
  <script src="${root }/resources/js/jquery.min.js"></script>
  <script src="${root }/resources/js/bootstrap.bundle.min.js"></script>

	<!-- Content ends -->
	<%@ include file="/WEB-INF/views/template/footer.jspf" %>
</body>

</html>
