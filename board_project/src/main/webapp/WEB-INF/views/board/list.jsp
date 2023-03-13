<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<style>
.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 50px 0 0 100px;
}

.pageInfo li {
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}

.active {
	background-color: #cdd5ec;
}
</style>
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
						<td><fmt:formatDate pattern="yyyy.MM.dd"
								value="${bvo.regdate}" /></td>
						<td><fmt:formatDate pattern="yyyy.MM.dd"
								value="${bvo.moddate}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</c:when>
		<c:otherwise>
			<tbody>
				<tr>
					<td colspan="6" class="text-center">
						<h3>등록된 게시글이 없습니다.</h3>
					</td>
				</tr>
			</tbody>
		</c:otherwise>
	</c:choose>
</table>
<div class="pageInfo_wrap">
	<div class="pageInfo_area">
		<ul id="pageInfo" class="pageInfo">
			<!-- 이전페이지 버튼 -->
			<c:if test="${pageMaker.prev}">
				<li class="pageInfo_btn previous"><a
					href="${pageMaker.startPage-1}">Previous</a></li>
			</c:if>
			<!-- 각 번호 페이지 버튼 -->
			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="pageInfo_btn ${pageMaker.page.pageNum == num ? "active":"" }"><a
					href="${num}">${num}</a></li>
			</c:forEach>
			<!-- 다음페이지 버튼 -->
			<c:if test="${pageMaker.next}">
				<li class="pageInfo_btn next"><a
					href="${pageMaker.endPage + 1 }">Next</a></li>
			</c:if>
		</ul>
	</div>
</div>
<form id="moveForm" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.page.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.page.amount }">
</form>
<script>
	$(document).ready(function() {
		let result = '<c:out value="${result}"/>';

		checkAlert(result);

		function checkAlert(result) {

			if (result === '') {
				return;
			}
			if (result === "regist success") {
				alert("게시글 등록이 완료되었습니다.");
			}
			if (result === "modify success") {
				alert("게시글 수정이 완료되었습니다.");
			}
			if (result === "delete success") {
				alert("게시글 삭제가 완료되었습니다.");
			}

		}

		let moveForm = $("#moveForm");

		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/board/list");
			moveForm.submit();

		});
	});
</script>
<jsp:include page="../common/footer.jsp" />