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
<title>vote</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<section style="position:fixed; top: 140px; height:100%; width:100%; background-color: lightgray;">
<h2 style="text-align: center;">투표하기</h2>
<form action="voteAction.jsp" method="post" name="frm"
		style="text-align: center; display: flex; justify-content: center; align-content: center;">
	<input type="hidden" value="vote">  
<table border="1">


<tr>
<td>주민번호</td>
<td><input type="text" name="v_jumin" >예: 8906153154726</td>
</tr>
<tr>
<td>성명</td>
<td><input type="text" name="v_name" style="width:97%"></td>
</tr>
<tr>
<td>투표번호</td>
<td>
<select name="m_no" style="width:100%">
<option value=""></option>
<option value="1">[1] 김후보</option>
<option value="2">[2] 이후보</option>
<option value="3">[3] 박후보</option>
<option value="4">[4] 조후보</option>
<option value="5">[4] 최후보</option>
</select>
</td>
</tr>
<tr>
<td>투표시간</td>
<td><input type="text" name="v_time" style="width:97%" placeholder="0930"></td>
</tr>
<tr>
<td>투표장소</td>
<td><input type="text" name="v_area" style="width:97%" placeholder="제1투표장"></td>
</tr>
<tr>
<td>유권자확인</td>
<td>
<input type="radio" name="v_confirm" value="Y">확인
<input type="radio" name="v_confirm" value="N">미확인
</td>
</tr>
<tr>
<td colspan="2">
<input type="button" value="투표하기" onclick="return voteCheck()">
<input type="button" value="다시하기" onclick="return res()">
</td>
</tr>



</table>

</form>

</section>



<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript" src="../js/check.js"></script>
</body>
</html>