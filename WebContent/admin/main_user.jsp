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

	UserBean result = (UserBean) request.getSession().getAttribute(
			"result");
%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Manage User</title>

<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/admin-main.css" rel="stylesheet">
<style type="text/css"></style>
</head>

<body style="background:#DCDCDC;">

	<div class="container">
		<div class="masthead">
			<h3 class="text-muted">Welcome! <%=result.getUsername() %> ~</h3>
			<ul class="nav nav-justified">
				<!-- <li><a href="/Homework/admin/main.jsp">Home</a></li>  -->
				<li class="active"><a href="/Homework/admin/main_user.jsp"
					class="active">Manage User</a></li>
				<li><a href="/Homework/admin/main_project.jsp">Manage Project</a></li>
			</ul>
		</div>
		<div class="up_content">
			<button type="button" class="btn btn-default btn-lg"
				onclick="window.location.href='/Homework/admin/register.jsp'"
				style="float: right;color:#6A5ACD">ADD USER</button>
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
						<th>Password</th>
						<th>BankCardNumber</th>
						<th>Position</th>
						<th>Delete</th>
						<th>Modify</th>
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
						<td><%=user.getPassword()%></td>
						<td><%=user.getCardNumber()%></td>
						<td><%=user.getPosition()%></td>
						<td width="10px"><button type="button" class="btn btn-danger"
								onclick="window.location.href='/Homework/admin/deleteuser?deleteUserID=<%=i + (currentPage - 1) * 6%>&currentPage=<%=currentPage%>'">DELETE</button></td>
						<td width="10px"><button type="button" class="btn btn-info"
								onclick="window.location.href='/Homework/admin/modify?modifyUserID=<%=i + (currentPage - 1) * 6%>'">MODIFY</button></td>
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
						href="/Homework/admin/main_user.jsp?currentPage=<%=currentPage - 1%>">&laquo;</a></li>
					<%
						} else {
					%>
					<li><a href="/Homework/admin/main_user.jsp?currentPage=1">&laquo;</a></li>
					<%
						}
					%>
					<%
						int i = 1;
						for (; i <= pageNum; i++) {
					%>

					<li><a href="/Homework/admin/main_user.jsp?currentPage=<%=i%>"><%=i%></a></li>

					<%
						}
					%>
					<%
						if (currentPage < pageNum) {
					%>
					<li><a
						href="/Homework/admin/main_user.jsp?currentPage=<%=currentPage + 1%>">&raquo;</a></li>
					<%
						} else {
					%>
					<li><a
						href="/Homework/admin/main_user.jsp?currentPage=<%=pageNum%>">&raquo;</a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
		<!-- Site footer -->
		<div class="footer">
			<p style="text-align: center">© xxd 2013</p>
		</div>

	</div>

</body>
</html>