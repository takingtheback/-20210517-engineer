<!-- pollList.jsp -->
<%@page import="java.util.Vector"%>
<%@page import="com.side_on.poll.PollListBean"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="com.side_on.poll.PollMgr"/>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<title>JSP Poll</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%@ include file="../inc/header.jsp" %>
<header class="bg-warning py-5">
    <a href="/board/QnABoard" style="text-decoration:none">
    	<div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
        <!-- 헤더...어떻게... -->
        <div style="padding-top: 8%;">
            <h1 class="display-5 fw-bolder">투표하기</h1>
            <p class="lead fw-normal text-white-80 mb-0">투표리스트를 확인하고 투표를 해보세요.</p>
	    </div>
	    </div>
		</div>
 	</a>
</header><br>
	
<div align="center">
<jsp:include page="pollForm.jsp"/>
<b><font size="6em">설문 리스트</font></b><br><br>
<table>
	<tr>
		<td>
		<table  border="1" width="1700" height="500">
			<tr>
				<th width="10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="6em">번호</font></th>
				<th width="250" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="6em">질문</font></th>
				<th width="200">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="6em">시작일~종료일</font></th>
			</tr>
			<%
					Vector<PollListBean> vlist = mgr.getPollList();
					for(int i=0;i<vlist.size();i++){
						PollListBean plBean = vlist.get(i);
						int num = plBean.getNum();
						String question = plBean.getQuestion();
						String sdate = plBean.getSdate();
						String edate = plBean.getEdate();
			%>
			<tr>
				<td align="center"><font size="6em"><%=vlist.size()-i%></font></td>
				<td><a href="pollList?num=<%=num%>" style="color:black;"><font size="6em"><%=question%></font></a></td>
				<td align="center"><font size="6em"><%=sdate+"~"+edate%></font></td>
			</tr>
			<%}//---for%>
		</table>
		</td>
	</tr>
	<tr>
		<td align="center"><br>
		<button type="button" style="WIDTH:150pt; HEIGHT:70pt" class="btn btn-warning" onclick="location.href='/vote/pollInsert'"><font size="6em">투표만들기</font></button>
		</td>
	</tr>
</table>
</div>
</body>
</html>
