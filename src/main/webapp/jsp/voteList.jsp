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
<title>voteList</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<section style="position:fixed; top: 140px; height:100%; width:100%; background-color: lightgray;">
<h2 style="text-align: center;">투표검수조회</h2>
<form action="voteAction.jsp" method="post" name="frm"
		style="text-align: center; display: flex; justify-content: center; align-content: center;">
<table border="1">

<tr>
<td>성명</td>
<td>생년월일</td>
<td>나이</td>
<td>성별</td>
<td>후보번호</td>
<td>투표시간</td>
<td>유권자확인</td>
</tr>

<%
Connection conn = null;
PreparedStatement pstmt = null;
String v_confirm = "";
String v_gender = "";

try{
	conn = OracleUtil.getConnection();
	String sql = "select "+
			"v_name,  "+
			"'19'||substr(v_jumin,1,2)||'년'||substr(v_jumin,3,2)||'월'||substr(v_jumin,5,2)||'일생' v_jumin,  "+
			"to_number(to_char(sysdate,'yyyy'))-to_number('19'||substr(v_jumin,1,2)) v_age,  "+
			"substr(v_jumin,7,1) v_gender,  "+
			"m_no,  "+
			"substr(lpad(v_time,4,'0'),1,2)||':'||substr(lpad(v_time,4,'0'),3,2) v_time,  "+
			"v_confirm "+
		"from TBL_VOTE_202005 "+
		"where v_area='제1투표장'";
	pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		v_confirm = rs.getString(7);
		switch(v_confirm){
		case "Y": 
			v_confirm = "확인";
			break;
		case "N": 
			v_confirm = "미확인";
			break;
		
		}
		v_gender = rs.getString(4);
		switch(v_gender){
		case "1": 
			v_gender = "남";
			break;
		case "2": 
			v_gender = "여";
			break;
		
		}
				
		
		
		%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=v_gender %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
<td><%=v_confirm %></td>
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