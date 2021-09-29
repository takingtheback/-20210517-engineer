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
<jsp:include page="../inc/header.jsp"/><br><br><br><br>
	
	<header class="bg-warning py-5">
            <div class="container px-5 px-lg-5 my-5">
                <div class="text-center text-white">
                <!-- 헤더...어떻게... -->
                <div style="padding-top: 1%;">
                    <h1 class="display-5 fw-bolder">투표하기</h1>
                    <p class="lead fw-normal text-white-80 mb-0">투표리스트를 확인하고 투표를 해보세요.</p>
            </div>
            </div>
         </div>
        </header><br><br>
<div align="center">
<jsp:include page="pollForm.jsp"/>
<b>설문 리스트</b>
<table>
	<tr>
		<td>
		<table  border="1" width="900" height="500">
			<tr>
				<th width="50">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번호</th>
				<th width="250" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;질문</th>
				<th width="200">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시작일~종료일</th>
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
				<td align="center"><%=vlist.size()-i%></td>
				<td><a href="pollList?num=<%=num%>" style="color:black;"><%=question%></a></td>
				<td align="center"><%=sdate+"~"+edate%></td>
			</tr>
			<%}//---for%>
		</table>
		</td>
	</tr>
	<tr>
		<td align="center"><br>
		<button type="button"  class="btn btn-warning" onclick="location.href='/vote/pollInsert'">투표만들기</button>
		</td>
	</tr>
</table>
</div>
</body>
</html>
