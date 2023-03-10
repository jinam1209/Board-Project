<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<h1>게시판 등록</h1>
	<form action="/board/regist" method="post">
	    <div class="input_wrap">
	        <label>Title</label>
	        <input name="title">
	    </div>
	    <div class="input_wrap">
	        <label>Content</label>
	        <textarea rows="3" name="content"></textarea>
	    </div>
	    <div class="input_wrap">
	        <label>Writer</label>
	        <input name="writer">
	    </div>
	    <button>등록</button>
	</form>
<script>
    $(document).ready(function(){
    	let result = '<c:out value="${result}"/>';
        
        checkAlert(result);
        
        function checkAlert(result){
            
            if(result === ''){
                reutrn;
            }
            
            if(result === "regist success"){
                alert("게시글 등록이 완료되었습니다.");
            }
            
        } 
 
    });
 
</script>
</body>
</html>