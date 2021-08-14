<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>JSP Poll</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function send() {
		f = document.frm;
		f.edate.value = f.edateY.value+"-"
		+ f.edateM.value+"-"+f.edateD.value;
		f.submit();
	}
</script>
</head>
<jsp:include page="../inc/header.jsp"/><br><br><br><br>
	
	<header class="bg-warning py-5">
            <div class="container px-5 px-lg-5 my-5">
                <div class="text-center text-white">
                <!-- 헤더...어떻게... -->
                <div style="padding-top: 1%;">
                    <h1 class="display-5 fw-bolder">투표만들기</h1>
                    <p class="lead fw-normal text-white-80 mb-0">투표를 만들어보세요.</p>
            </div>
            </div>
         </div>
        </header>
	<div align="center">
		
		<hr width="600" />
		<b>설문작성</b>
		<hr width="600" />
		<form name="frm" method="post" action="pollInsertProc">
			<table border="1" width="900" height="500">
				<tr>
					<td><b>질문</b></td>
					<td colspan="2"><input name="question" size="65"></td>
				</tr>
				<tr>
					<td rowspan="5"><b>항목</b></td>
					<%
						for (int i = 1; i <= 4; i++) {
							out.println("<td>" + (i * 2 - 1)
									+ ": <input name='item'></td>");
							out.println("<td>" + (i * 2)
									+ ": <input name='item'></td>");
							out.println("</tr>");
							if (i == 9) {
								out.println("");
							} else {
								out.println("<tr>");
							}
						}
					%>
				<tr>
					<td>종료일</td>
					<td colspan=2><select name="edateY">
							<option value="2020">2020
							<option value="2021">2021
					</select>년 <select name="edateM">
							<%
								for (int i = 1; i <= 12; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
					</select>월 <select name="edateD">
							<%
								for (int i = 1; i <= 31; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
					</select>일</td>
				</tr>
				<tr>
					<td>복수투표</td>
					<td colspan=2>
						<input type="radio" name="type" value="1" checked>yes 
						<input type="radio" name="type" value="0">no
					</td>
				</tr>
				<tr>
					<td colspan=3>
					<button type="submit" class="btn btn-warning" onclick="send()">작성하기</button>
					<button type="button"  class="btn btn-danger" onclick="location.href='/vote/pollInsert'">다시쓰기</button>
					<button type="button" class="btn btn-info" onClick="javascript:location.href='pollList'">리스트</button>
					</td>
				</tr>
			</table>
			<input type="hidden" name="sdate">
			<input type="hidden" name="edate">
		</form>
	</div>
</body>
</html>
