<!-- pollFormProc.jsp -->
<%@ page  contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="mgr" class="com.side_on.poll.PollMgr"/>
<%
	int listNum=Integer.parseInt(request.getParameter("num"));
	String itemNum[] = request.getParameterValues("itemnum");
	boolean result = mgr.updatePoll(listNum, itemNum);
	String msg="투표에 실패 하였습니다.";
	if(result) msg="투표를 하였습니다.";
	String url = "pollList";
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>