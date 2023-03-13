<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<h1>${bvo.title }</h1>
  <div class="form-group">
    <label for="bno">번호</label>
    <input type="text" class="form-control" readonly="readonly" id="bno" name="bno" value="${bvo.bno }"> 
  </div>
  <div class="form-group">
    <label for="title">제목</label>
    <input type="text" class="form-control" readonly="readonly" id="title" name="title" value="${bvo.title }">
  </div>
  <div class="form-group">
    <label for="content">내용</label>
    <input type="text" class="form-control" readonly="readonly" id="content" name="content" value="${bvo.content }">
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
  <a href="/board/modify?bno=${bvo.bno }" class="btn btn-outline-primary" id="modBtn">수정</a>
  <a href="/board/list" class="btn btn-outline-success float-right">목록으로</a>
<jsp:include page="../common/footer.jsp" />
