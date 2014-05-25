<html lang="zh-cn">
<%@page import="xxd.nju.homework.dao.UserDao"%>
<%@page import="xxd.nju.homework.dao.impl.UserDaoImpl"%>
<%@page import="xxd.nju.homework.model.UserBean"%>
<%@page import="java.util.*"%>
<%
	UserDao userDao = new UserDaoImpl();
	ArrayList<UserBean> userList = userDao.getAllUser();
	int currentPage = 1;
	String ss = request.getParameter("currentPage");
	if (ss != null)
		currentPage = Integer.parseInt(ss);
	int pageNum = userList.size() / 6;
	if (userList.size() % 6 != 0)
		pageNum++;
%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Homework</title>

<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/admin-main.css" rel="stylesheet">
<style type="text/css"></style>
</head>

<body>

	<div class="container">

		<div class="masthead">
			<h3 class="text-muted">Welcome!</h3>
			<ul class="nav nav-justified">
				<li><a href="/Homework/financer/main.jsp">Home</a></li>
				<li class="active"><a
					href="/Homework/financer/main_user.jsp">User</a></li>
				<li><a href="/Homework/financer/main_project.jsp">Project</a></li>
				<li><a href="/Homework/financer/main_check.jsp">Check</a></li>
			</ul>
		</div>
		<div class="content">

			<div class="panel panel-info">
				<%
					if (userList.size() == 0) {
				%>
				<h1>No User Is Available !!</h1>
				<%
					} else {
				%>
				<table class="table table-bordered table-striped">
					<tr>
						<th>UserID</th>
						<th>UserName</th>
						<th>CardNumber</th>
						<th>Position</th>
					</tr>
					<%
						for (int i = 0; i < 6; i++) {
								if (i + (currentPage - 1) * 6 == userList.size())
									break;
								UserBean user = userList.get(i + (currentPage - 1) * 6);
					%>
					<tr>
						<td><%=user.getUserID()%></td>
						<td><%=user.getUsername()%></td>
						<td><%=user.getCardNumber()%></td>
						<td><%=user.getPosition()%></td>
					</tr>
					<%
						}
					%>
				</table>
				<%
					}
				%>
			</div>
			<div class="pagediv">
				<ul class="pagination pagination-lg">
					<%
						if (currentPage > 1) {
					%>
					<li><a
						href="/Homework/financer/main_user.jsp?currentPage=<%=currentPage - 1%>">&laquo;</a></li>
					<%
						} else {
					%>
					<li><a href="/Homework/financer/main_user.jsp?currentPage=1">&laquo;</a></li>
					<%
						}
					%>
					<%
						int i = 1;
						for (; i <= pageNum; i++) {
					%>

					<li><a
						href="/Homework/financer/main_user.jsp?currentPage=<%=i%>"><%=i%></a></li>

					<%
						}
					%>
					<%
						if (currentPage < pageNum) {
					%>
					<li><a
						href="/Homework/financer/main_user.jsp?currentPage=<%=currentPage + 1%>">&raquo;</a></li>
					<%
						} else {
					%>
					<li><a
						href="/Homework/financer/main_user.jsp?currentPage=<%=pageNum%>">&raquo;</a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
		<!-- Site footer -->
		<div class="footer">
			<p>© xxd 2013</p>
		</div>

	</div>

</body>
</html>