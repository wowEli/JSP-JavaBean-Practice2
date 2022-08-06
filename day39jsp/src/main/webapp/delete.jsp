<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.dao.MemberDAO,model.vo.MemberVO"%>
    
        <%request.setCharacterEncoding("UTF-8");%>
    <jsp:useBean id="model" class="model.dao.MemberDAO"></jsp:useBean>
<jsp:useBean id="vo" class="model.vo.MemberVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo" />
<%
model.delete(vo);
response.sendRedirect("index.jsp");
%>
