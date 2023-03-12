<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<h1>게시판 등록</h1>
	<form action="/board/regist" method="post">
	  <div class="form-group">
	    <label for="title">제목</label>
	    <input type="text" class="form-control" id="title" name="title">
	  </div>
	  <div class="form-group">
	    <label for="content">내용</label>
	    <input type="text" class="form-control" id="content" name="content">
	  </div>
	  <div class="form-group">
	    <label for="writer">작성자</label>
	    <input type="text" class="form-control" id="writer" name="writer">
	  </div>
	  <button type="submit" class="btn btn-primary">등록</button>
	</form>
<jsp:include page="../common/footer.jsp" />
