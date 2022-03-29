<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
<br><br>

<c:choose>
	<c:when test="${loginUser == null}">
		<h3 style="color:red" >${message}</h3>
		<form action="/login" method="post" >
		</form>
	</c:when>
	<c:when test="${loginUser != null}">
		<div class="form-group" style="display:inline-block;">
			<label><h2> 로그인 By ${loginUser} </h2></label>
			<button class="btn btn-primary" onclick="location.href='/logout'">Logout ?</button>
		</div>
	</c:when>
</c:choose>

 </div>
 <br><br>
 
 <%@ include file="./bootstrap.jsp" %>