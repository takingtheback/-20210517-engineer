<%@page import="java.util.Vector"%>
<%@page import="com.side_on.poll.PollListBean"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="com.side_on.poll.PollMgr"/>
<%
		request.setCharacterEncoding("UTF-8");
		int num = 0;
		if(request.getParameter("num")!=null){
			num = Integer.parseInt(request.getParameter("num"));
		}
		PollListBean plBean = mgr.getPoll(num);
		Vector<String> vItem = mgr.getItemList(num);
		String question = plBean.getQuestion();
		int type = plBean.getType();
		int active = plBean.getActive();
		int sumCount = mgr.sumCount(num);
%>
<form action="pollFormProc"> 
<table border="1" width="500" height="100">
	<tr>
		<td colspan="2" width="300">
			Q : <%=question%> <font color="blue">(<%=sumCount%>)</font>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<%
				for(int i=0;i<vItem.size();i++){
					String item = vItem.get(i);
		%>
		<%if(type==1){%>
			<input type="checkbox" name="itemnum" value="<%=i%>">
		<%}else if(type==0){ %>
			<input type="radio" name="itemnum" value="<%=i%>">
		<%}%>
		<%=item%><br>
		<%}%>
		</td>
	</tr>
	<tr>
		<td width="150">
		<%if(active==1){%>
		<button type="submit" class="btn btn-warning">투표</button>
		<%}else{%>
			투표종료
		<%}%>	
		</td>
		<td><td>
		<button type="button" class="btn btn-info" onclick="javascript:window.open('pollView?num=<%=num%>'
			,'pollView','width=500, height=350')">결과</button>
		</td>
	</tr>
</table>	
<input type="hidden" name="num" value="<%=num%>">
</form>
