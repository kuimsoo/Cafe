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
					    <td>상품 ID</td>
					    <td>
					        <input type="text" id="coffeeid" placeholder="ID가 없다면 상품추가.">
					    </td>
					</tr>
                    <tr>
                        <td>메뉴이름</td>
                        <td><input type="text" id="coffeename"></td>
                    </tr>
                    <tr>
                        <td>가격</td>
                        <td><input type="text" id="coffeeprice"></td>
                    </tr>
                    <tr>
                        <td>디카페인</td>
                        <td><input type="text" id="decaf" placeholder="가능/불가능 둘중 하나입력"></td>                       
                    </tr>	                 	
                    <tr>
                        <td>이미지경로</td>
                        <td><input type="text" id="coffeeimage_path"  value="/coffee/.jpg" ></td>	                  
                    </tr>
                    <tr>
                    	<td>제품설명</td>
                    	<td><textarea cols="30" id="coffeeinfo"></textarea></td>
                    </tr>
                    <tr style="text-align: center;">
                    	<td><button id="plus1">상품추가</button></td>
                    	<td><button id="modify1">상품수정</button></td>
                    </tr>
                    <tr>
                    	<td>이미지첨부</td><td><input type="file" id="coffeefile" style="width:200px"></td>                  
                    </tr>
                     <tr><td colspan="2"><input type="button" id="coffeeimage" value="이미지추가"></td></tr>                      
                </table>
            </div>
        </div>
        <div id="coffeecontainer" style="flex: 2; padding: 10px; display: flex; flex-direction: column;">
            <h1>커피 메뉴</h1>  <!-- 모델로 만들어보기 -->
            <div style="flex: 1; max-height: 300px; overflow-y: auto;"> <!-- 스크롤 추가 -->
                <table id="coffeetable" border="1" style="width: 100%; border-collapse: collapse;">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>메뉴이름</th>
                            <th>가격</th>
                            <th>디카페인</th>                          
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
                                <td>${menu_coffee.image_path}</td>
                                <td>${menu_coffee.info}</td>
                             
                                <td><button class="coffeedelete">삭제</button></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
     <div style="display: flex;">
	    <div id="dessertmodify" style="flex: 0.5; border: 1px solid #ccc; padding: 10px; display: flex; flex-direction: column;" >
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
	    <div id="dessertcontainer" style="flex: 2; padding: 10px; display: flex; flex-direction: column;">
	            <h1>커피 메뉴</h1>  <!-- 모델로 만들어보기 -->
            <div style="flex: 1; max-height: 300px; overflow-y: auto;"> <!-- 스크롤 추가 -->
                <table id="Dessertlist"  border="1" style="width: 100%; border-collapse: collapse;">
                    <thead>
                        <tr>
        					<td>번호</td><td>이름</td><td>가격</td><td>이미지경로</td><td>제품설명</td><td>삭제</td>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>	      
	    </div>
	</div>
</div>	
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function() {
    selectDessert();
    
});    
$(document)

.on('click', '#coffeeimage', function() {
    if ($('#coffeefile').val() == '') {
        alert('이미지파일을 선택해주세요.');
    } else {
        let formData = new FormData();
        formData.append('coffeefile', $('#coffeefile')[0].files[0]);
        
        $.ajax({
            url: '/coffeeimage',
            type: 'post',
            data: formData,
            contentType: false,
            processData: false,
            success: function(data) {
                alert('이미지가 업로드가 완료되었습니다.');
            }
        });
    }  
})
.on('click', '#plus1', function() {
	let name=$("#coffeename").val();
	let price=$('#coffeeprice').val();
	let decaf=$('#decaf').val();
	let image_path=$('#coffeeimage_path').val();
	let info=$('#coffeeinfo').val();
	let coffeefile=$('#coffeefile').val();
	
	
    if (name === '' || price === '' || decaf === '' || image_path === ''||image_path==='/coffee/.jpg'|| info === '') {
        alert('모든 항목을 입력해주세요.');
    } else if (decaf !== '불가능' && decaf !== '가능') {
        alert("가능 또는 불가능으로 입력해주세요.");
	} else{
		$.ajax({
			url:'/insertCoffee',
			type:'post',
			data:{name:name,price:price,decaf:decaf,image_path:image_path,info:info},
			dataType:'text',
			 success:function(data){
				console.log(data);
				window.location.reload();
				
					
			}
		});
	}
})
.on('click','#coffeetable tbody tr',function(){
	
	let id=$(this).find('td:eq(0)').text();
	let name=$(this).find('td:eq(1)').text();
	let price=$(this).find('td:eq(2)').text();
	let decaf=$(this).find('td:eq(3)').text();
	let image_path=$(this).find('td:eq(4)').text();
	let info=$(this).find('td:eq(5)').text();
	
	$('#coffeeid').val(id);
	$('#coffeename').val(name);
	$('#coffeeprice').val(price);
	$('#decaf').val(decaf);
	$('#coffeeimage_path').val(image_path);
	$('#coffeeinfo').val(info);

	
})
.on('click','#modify1',function(){
	let id=$('#coffeeid').val();
	let name=$("#coffeename").val();
	let price=$('#coffeeprice').val();
	let decaf=$('#decaf').val();
	let image_path=$('#coffeeimage_path').val();
	let info=$('#coffeeinfo').val();
	let coffeefile=$('#coffeefile').val();
	
	
    if (id==='' ||name === '' || price === '' || decaf === '' || image_path === ''||image_path==='/coffee/.jpg'|| info === '') {
        alert('모든 항목을 입력해주세요.');
    }else if (decaf !== '불가능' && decaf !== '가능') {
        alert("가능 또는 불가능으로 입력해주세요.");
    }else{
    
    	if(confirm("상품을 수정하시겠습니까?")){
    		
    		$.ajax({
    			url:'/updateCoffee',
    			type:'post',
    			data:{id:id,name:name,price:price,decaf:decaf,image_path:image_path,info:info},
    			dataType:'text',	
    			success: function(data){
    				console.log(data);
    				alert("상품이 추가 되었습니다.")
    				window.location.reload();    			
    			}   			
    		})
    	}
    }
	
})
.on('click','.coffeedelete',function(){

	 let id = $(this).closest('tr').find('td:eq(0)').text();
		 
	 if (confirm("이 상품을 삭제하시겠습니까?")) {
		 $.ajax({
		 	url:('/deleteCoffee'),
		 	type:'post',
		 	data:{id:id},
		 	dataType:'text',
		 	success:function(data){
		 		alert("상품이 삭제되었습니다.")
		 		window.location.reload(); 		
		 	}
		
		 });
	 }
})

function selectDessert() {
    $.ajax({
        url: '/selectDessert',
        type: 'post',
        data: {},
        dataType: 'json',
        success: function(data) {
            console.log(data); // 데이터 확인
            $('#Dessertlist tbody').empty(); // tbody 비우기
            for (let x of data) {
                let str = "<tr>" +
                    "<td>" + x['id'] + "</td>" +
                    "<td>" + x['name'] + "</td>" +
                    "<td>" + x['price'] + "</td>" +
                    "<td>" + x['image_path'] + "</td>" +
                    "<td><textarea readonly>" + x['info'] + "</textarea></td>" + // info가 없을 경우 대비
                    "<td><input type='button' class='dessertdel' value='삭제'></td>" +
                    "</tr>";
                $('#Dessertlist tbody').append(str); // tbody에 행 추가
                console.log(str);
            }
          
        }    
    });
}









/* function showinquiry(){
	$.post('/showinquiry',{},function(data){
		$('#inquirylist tbody').empty();
		for( let x of data){
			let str ='<tr><td style=display:none>'+x['id']+'</td><td style=display:none>'+x['content']+'</td><td style=display:none>'+x['answer']+'</td><td>'+x['nickname']+'</td><td>'+x['title']+'</td><td>'+
			x['current']+'</td><td>'+x['created']+'</td><td>'+x['ancreated']+'</td><td><input type=button id=inquirydel value=삭제></td></tr>'
			$('#inquirylist tbody').append(str);
		}
		
	},'json')
} */






</script>
</html>