<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="model.dao.MemberDAO,model.vo.MemberVO"%>
<%request.setCharacterEncoding("UTF-8");%>
<!-- 인코딩 해야 사용자의 입력이 안깨지고 db에 들어감 -->
<jsp:useBean id="model" class="model.dao.MemberDAO"></jsp:useBean>
<jsp:useBean id="vo" class="model.vo.MemberVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>

	<form action="insert.jsp" method="post">
		<table border="2">
			<tr>
				<th colspan="2">회원 추가</th>
			</tr>
			<tr>
				<td>회원 이름</td>
				<td><input type="text" name="name" width="40px"></td>
			</tr>
			<tr>
				<td>회원 점수</td>
				<td><input type="number" min="0" name="score" width="40px"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="회원 등록"></th>
			</tr>
		</table>
	</form>
	
	<form action="delete.jsp" class="post">
		<table border="2">
			<tr>
				<th colspan="2">회원 제거</th>
			</tr>
			<tr>
				<td>회원 번호</td>
				<td><input type="number" min="0" name="mpk" width="40px"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="회원 삭제"></th>
			</tr>

		</table>
	</form>

	<form action="update.jsp" method="post">
		<table border="2">
			<tr>
				<th colspan="2">회원 정보 수정</th>
			</tr>
			<tr>
				<td>회원 번호</td>
				<td><input type="number" min="0" name="mpk" width="40px"></td>
			</tr>
			<tr>
				<td>점수 변경</td>
				<td><input type="number" min="0" name="score" width="40px"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="회원 수정"></th>
			</tr>
		</table>
	</form>


			<table border="2">
			<tr>
				<th width="215px">회원 목록</th>
			</tr>
	<%
		if(model.selectAll(vo).size() != 0){
		for (MemberVO mv : model.selectAll(vo)) {
	%>
				<tr>
					<th><a href="select.jsp?mpk=<%=mv.getMpk() %>"><%= mv.getMpk() %> <%=mv.getName() %></a></th>				
				</tr>
	<%	
		}
		}else{
			out.println("<TR><TH>데이터가 없습니다.</TH></TR>");
		}
	%>
			</table>

</body>
</html>