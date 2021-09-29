<%@page import="java.util.Random"%>
<%@page import="com.side_on.poll.PollItemBean"%>
<%@page import="java.util.Vector"%>
<%@page import="com.side_on.poll.PollListBean"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="com.side_on.poll.PollMgr"/>
<%
		request.setCharacterEncoding("UTF-8");
		int listNum=Integer.parseInt(request.getParameter("num"));
		PollListBean plBean = mgr.getPoll(listNum);
		Vector<PollItemBean> vlist = mgr.getView(listNum);
		int sumCnt= mgr.sumCount(listNum);
		int maxCnt = mgr.getMaxCount(listNum);
%>
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
                    <h1 class="display-5 fw-bolder">투표결과</h1>
                    <p class="lead fw-normal text-white-80 mb-0">투표결과를 확인해보세요.</p>
            </div>
            </div>
         </div>
        </header><br><br>
<div align="center"><br/>
<table border="1" width="800" height="400">
	<tr>
		<td colspan="4"><b><font size="5em">Q : <%=plBean.getQuestion()%></font></b></td>
	</tr>
	<tr>
		<td colspan="3"><b><font size="5em">총 투표자 :  <%=sumCnt%> 명</font></b></td>
		<td width="40"><b><font size="5em">count(%)</font></b></td>
	</tr>
	<%
		Random r =new Random();
		for(int i =0; i<vlist.size();i++){
			PollItemBean piBean = vlist.get(i);
			String item[]=piBean.getItem();
			int count = piBean.getCount();
			int ratio = (int)(Math.round((double)count/sumCnt*100));
			String rgb="#"+Integer.toHexString(r.nextInt(255*255*255));
	%>		
	<tr>
		<td width="20" align="center"><%=i+1%></td>
		<td width="120">
			<font size="3em"><%=item[0]%></font>
		</td>
		<td>
			<table width="<%=ratio%>"height="15">
			<tr><td bgcolor="<%=rgb%>"></td></tr>
			</table>
		</td>
		<td width="40"><font size="3em"><%=count%>(<%=ratio %>)</font></td>
	</tr>
	<%}//--for%>
</table><br>
<a href="javascript:window.close()" style="color:black;"><font size="6em">닫기</font></a>
</div>
</body>
</html>
