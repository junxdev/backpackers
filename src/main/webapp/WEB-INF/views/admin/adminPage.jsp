<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../template/head.jspf" %>
<meta charset="UTF-8">
<style type="text/css">

#title,#title2,#title3{

  border: solid 1px black;


}

.first{
margin:0px,auto ;
padding:0px,auto;
background-color: yellow;
width: 1850px;
height: 100px;
text-align: center;
}
.second{

background-color: orange;
width: 1850px;
height: 600px;

}

#menu{


}


</style>

<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/template/nav.jspf" %>
<%@include file="../template/header.jspf" %>
<div class="first">
<h1>관리자페이지</h1>
</div >



<div class="second" >
<dic id="menu">
<a class="btn btn-default" href="${root}/admin/addproduct" role="button">상품등록</a>
<a class="btn btn-default" href="${root}/admin/deleteproduct" role="button">상품수정/삭제</a>
<a class="btn btn-default" href="#" role="button">명소</a>
</div>
<div>
<input>

</div>
<%@include file="../template/footer.jspf" %>
</body>
</html>