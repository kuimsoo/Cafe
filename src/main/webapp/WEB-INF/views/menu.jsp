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
<div id="fullcontainer">
    <div style="display: flex;">
        <div id="coffeemodify" style="flex: 0.5; border: 1px solid #ccc; padding: 10px; display: flex; flex-direction: column;">
            <h1>상품추가/수정</h1>
            <div style="flex: 1; max-height: 300px; overflow-y: auto;"> <!-- 스크롤 추가 -->
                <table>
                    <tr>
                        <td>메뉴이름</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>가격</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>디카페인</td>
                        <td><input type="text"></td>
                    </tr>	
                    <tr>
                        <td>사이즈</td>
                        <td><input type="text"></td>
                    </tr>	
                    <tr>
                        <td>이미지경로</td>
                        <td><input type="text"></td>	                  
                    </tr>
                    <tr>
                    	<td>제품설명</td>
                    	<td><textarea cols="30"></textarea></td>
                    </tr>                      
                </table>
            </div>
        </div>

        <div id="mcontainer" style="flex: 2; padding: 10px; display: flex; flex-direction: column;">
            <h1>커피 메뉴</h1>  <!-- 모델로 만들어보기 -->
            <div style="flex: 1; max-height: 300px; overflow-y: auto;"> <!-- 스크롤 추가 -->
                <table border="1" style="width: 100%; border-collapse: collapse;">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>메뉴이름</th>
                            <th>가격</th>
                            <th>디카페인</th>
                            <th>사이즈</th>
                            <th>이미지경로</th>    
                            <th>제품설명</th>                   
                            <th>삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="menu_coffee" items="${arStore}">
                            <tr>
                                <td>${menu_coffee.id}</td>
                                <td>${menu_coffee.name}</td>
                                <td>${menu_coffee.price}</td>
                                <td>${menu_coffee.decaf}</td>
                                <td>${menu_coffee.size}</td>
                                <td>${menu_coffee.image_path}</td>
                                <td>${menu_coffee.info}</td>
                             
                                <td><button id="mdelete">삭제</button></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <div>
        <h1>디저트메뉴 목록</h1><!-- 아작스로 만들어보기 -->
      
    </div>
    
    <div>
        <h1>스낵 목록</h1>
       
    </div>
</div>
</body>
</html>