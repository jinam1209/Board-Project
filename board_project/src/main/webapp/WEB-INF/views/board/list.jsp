<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<h2 class="float-left">게시판</h2>
	<a href="/board/regist" class="btn btn-success float-right">등록</a>
  <table class="table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>내용</th>
        <th>등록일</th>
        <th>수정일</th>
      </tr>
    </thead>
    <c:choose>
    	<c:when test="${list.size() ne 0 }">
    		<tbody>
  		 	 <c:forEach items="${list }" var="bvo">
    		  <tr>
     		   <td>${bvo.bno }</td>
     		   <td>${bvo.writer }</td>
     		   <td>${bvo.content }</td>
     		   <td>${bvo.regdate }</td>
     		   <td>${bvo.moddate }</td>
    		  </tr>
    	 	 </c:forEach>
   		 	</tbody>
    	</c:when>
    	<c:otherwise>
    		<tbody>
    			<tr>
    				<td colspan="5" class="text-center">
    					<h3>등록된 직원이 없습니다.</h3>
    				</td>
    			</tr>
    		</tbody>
    	</c:otherwise>
    </c:choose>
    
  </table>

<jsp:include page="../common/footer.jsp" />