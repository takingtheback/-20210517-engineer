<!-- pollInsertProc.jsp -->
<%@page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="mgr" class="com.side_on.poll.PollMgr"/>
<jsp:useBean id="plBean" class="com.side_on.poll.PollListBean"/>
<jsp:setProperty property="*" name="plBean"/>
<jsp:useBean id="piBean" class="com.side_on.poll.PollItemBean"/>
<jsp:setProperty property="*" name="piBean"/>
<%
		boolean result = mgr.insertPoll(plBean, piBean);
		String msg = "설문 추가에 실패 하였습니다.";
		String url = "pollInsert";
		if(result){
			msg = "설문 추가에 성공 하였습니다.";
			url = "pollList";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>