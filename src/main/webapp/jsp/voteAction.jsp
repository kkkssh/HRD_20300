<%@page import="java.sql.ResultSet"%>
<%@page import="DBPKG.OracleUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>voteAction</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
PreparedStatement pstmt = null;
String v_jumin = request.getParameter("v_jumin");
String v_name = request.getParameter("v_name");
String m_no = request.getParameter("m_no");
String v_time = request.getParameter("v_time");
String v_area = request.getParameter("v_area");
String v_confirm = request.getParameter("v_confirm");

try{
	conn = OracleUtil.getConnection();
	String sql = "insert into tbl_vote_202005 values (?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, v_jumin);
	pstmt.setString(2, v_name);
	pstmt.setString(3, m_no);
	pstmt.setString(4, v_time);
	pstmt.setString(5, v_area);
	pstmt.setString(6, v_confirm);

	
	pstmt.executeUpdate();
	%>
	<jsp:forward page="voteList.jsp"></jsp:forward>
	<%

	
	
}catch(Exception e){
	e.printStackTrace();
}


%>

</body>
</html>