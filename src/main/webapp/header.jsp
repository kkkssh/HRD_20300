<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header style="position:fixed; top: 0px; height:100px; width:100%; text-align: center; line-height: 100px;
				background-color: blue; color: white; font-size: 23px;">
(과정평가형 정보처리산업기사)지역구의원투표 프로그램 ver 2020-05
</header>

<nav style="position:fixed; top: 100px; height:40px; width:100%; line-height: 40px;
				background-color: lightblue; ">
<a href="<%=request.getContextPath()%>/jsp/list.jsp" style="text-decoration: none; margin-left: 20px;">후보조회</a>
<a href="<%=request.getContextPath()%>/jsp/vote.jsp" style="text-decoration: none; margin-left: 20px;">투표하기</a>
<a href="<%=request.getContextPath()%>/jsp/voteList.jsp" style="text-decoration: none; margin-left: 20px;">투표검수조회</a>
<a href="<%=request.getContextPath()%>/jsp/ranking.jsp" style="text-decoration: none; margin-left: 20px;">후보자등수</a>
<a href="<%=request.getContextPath()%>" style="text-decoration: none; margin-left: 20px;">홈으로</a>
</nav>
</body>
</html>