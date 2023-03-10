<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<h1>${bvo.title }</h1>
	<form action="/board/modify" method="post" id="form">
	  <div class="form-group">
	    <label for="bno">번호</label>
	    <input type="text" class="form-control" readonly="readonly" id="bno" name="bno" value="${bvo.bno }"> 
	  </div>
	  <div class="form-group">
	    <label for="title">제목</label>
	    <input type="text" class="form-control" id="title" name="title" value="${bvo.title }">
	  </div>
	  <div class="form-group">
	    <label for="content">내용</label>
	    <input type="text" class="form-control" id="content" name="content" value="${bvo.content }">
	  </div>
	  <div class="form-group">
	    <label for="writer">작성자</label>
	    <input type="text" class="form-control" readonly="readonly" id="writer" name="writer" value="${bvo.writer }">
	  </div>
	  <div class="form-group">
	    <label for="regdate">등록일</label>
	    <input type="text" class="form-control" readonly="readonly" id="regdate" name="regdate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${bvo.regdate}"/>'>
	  </div>
	  <div class="form-group">
	    <label for="moddate">수정일</label>
	    <input type="text" class="form-control" readonly="readonly" id="moddate" name="moddate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${bvo.moddate}"/>'>
	  </div>
	  <button type="submit" class="btn btn-outline-primary" id="modify_btn">수정</button>
	  <a class="btn btn-outline-danger" id="delete_btn">삭제</a>
	  <a href="/board/list" class="btn btn-outline-success float-right">목록으로</a>
	</form>
	
<script>
	/* 삭제 버튼 */
	$("#delete_btn").on("click", function(e){
	    $("#form").attr("action", "/board/delete");
	    $("#form").attr("method", "post");
	    $("#form").submit();
	});
</script>

<jsp:include page="../common/footer.jsp" />
