<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
</head>
<body>
	<h1>메뉴 목록</h1>
		<table border="1"> 
			<thead>
	            <tr>
	                <th>번호</th>
	                <th>이름</th>
	                <th>가격</th>
	            </tr>
        	</thead>
	        <tbody>
	            <c:forEach var="menu" items="${arStore}">
	                <tr>
	                    <td>${menu.id}</td>
	                    <td>${menu.name}</td>
	                    <td>${menu.price}</td>
	                </tr>
			</c:forEach>	
		</table>
</body>
</html>