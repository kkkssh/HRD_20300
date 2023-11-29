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
<title>ranking</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<section style="position:fixed; top: 140px; height:100%; width:100%; background-color: lightgray;">
<h2 style="text-align: center;">후보자등수</h2>
<form action="voteAction.jsp" method="post" name="frm"
		style="text-align: center; display: flex; justify-content: center; align-content: center;">
<table border="1">
<tr>
<td>후보번호</td>
<td>성명</td>
<td>총투표건수</td>
</tr>


<%
Connection conn = null;
PreparedStatement pstmt = null;


try{
	conn = OracleUtil.getConnection();
	String sql = "select me.m_no, me.m_name, count(*) rank "+
			"from TBL_MEMBER_202005 me, TBL_VOTE_202005 vo "+
			"where me.m_no = vo.m_no "+
			"and v_confirm = 'Y' "+
			"group by me.m_no, me.m_name "+
			"order by rank desc";
	pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
	
				
		
		
		%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
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