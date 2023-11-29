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
<title>list</title>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<section style="position:fixed; top: 140px; height:100%; width:100%; background-color: lightgray;">
<h2 style="text-align: center;">후보조회</h2>
<form action="voteAction.jsp" method="post" name="frm"
		style="text-align: center; display: flex; justify-content: center; align-content: center;">
<table border="1">
<tr>
<td>후보번호</td>
<td>성명</td>
<td>소속정당</td>
<td>학력</td>
<td>주민번호</td>
<td>지역구</td>
<td>대표전화</td>
</tr>

<%
Connection conn = null;
PreparedStatement pstmt = null;
String p_school = "";

try{
	conn = OracleUtil.getConnection();
	String sql = "SELECT "+
		    "me.m_no, me.m_name, pa.p_name, me.p_school, "+
		    "substr(me.m_jumin, 1, 7) || '-' || substr(me.m_jumin, 7, 13) m_jumin, "+
		    "me.m_city, "+
		    "pa.p_tel1 || '-' || pa.p_tel2 || '-' || pa.p_tel3 p_tel "+
		"FROM "+
		    "tbl_member_202005 me, "+
		    "tbl_party_202005 pa "+
		"WHERE "+
		   "me.p_code = pa.p_code";
	pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		p_school = rs.getString(4);
		switch(p_school){
		case "1": 
			p_school = "고졸";
			break;
		case "2": 
			p_school = "학사";
			break;
		case "3": 
			p_school = "석사";
			break;
		case "4": 
			p_school = "박사";
			break;
		}
				
		
		
		%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=p_school %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
</tr>		
		
		
		<%
	}
	
	
	
}catch(Exception e){
	e.printStackTrace();
}

%>




</table>

</form>

</section>



<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript" src="../js/check.js"></script>
</body>
</html>