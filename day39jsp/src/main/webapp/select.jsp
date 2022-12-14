<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.dao.MemberDAO,model.vo.MemberVO"%>

<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="model" class="model.dao.MemberDAO"></jsp:useBean>
<jsp:useBean id="vo" class="model.vo.MemberVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 페이지</title>
</head>
<body>
<form action="index.jsp">
	<table border="2">
		<tr>
			<th colspan="2">회원 정보</th>
		</tr>
		<tr>
			<th>회원 번호</th>
			<th><%=model.selectOne(vo).getMpk() %></th>
		</tr>
		<tr>
			<th>회원 이름</th>
			<th><%=model.selectOne(vo).getName() %></th>
		</tr>
		<tr>
			<th>회원 점수</th>
			<th><%=model.selectOne(vo).getScore() %></th>
		</tr>
		<tr>
			<th colspan="2"><input type="submit" value="메인으로 돌아가기"></th>
		</tr>
	</table>
</form>

</body>
</html>