<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
     		   <td><a href="/board/detail?bno=${bvo.bno }">${bvo.title }</a></td>
     		   <td>${bvo.writer }</td>
     		   <td>${bvo.content }</td>
     		   <td><fmt:formatDate pattern="yyyy.MM.dd" value="${bvo.regdate}"/></td>
     		   <td><fmt:formatDate pattern="yyyy.MM.dd" value="${bvo.moddate}"/></td>
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
<script>
    $(document).ready(function(){
    	let result = '<c:out value="${result}"/>';
        
        checkAlert(result);
        
        function checkAlert(result){
            
            if(result === ''){
                return;
            }
            if(result === "regist success"){
                alert("게시글 등록이 완료되었습니다.");
            }
            if(result === "modify success"){
                alert("게시글 수정이 완료되었습니다.");
            }
            if(result === "delete success"){
                alert("게시글 삭제가 완료되었습니다.");
            }
            
        } 
 
    });
 
</script>
<jsp:include page="../common/footer.jsp" />