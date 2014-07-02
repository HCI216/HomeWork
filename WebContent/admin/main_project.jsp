<%@page import="xxd.nju.homework.model.ProjectBean"%>
<%@page import="xxd.nju.homework.dao.ProjectDao"%>
<%@page import="xxd.nju.homework.dao.impl.ProjectDaoImpl"%>
<%@page import="java.util.*"%>
<%@page import="xxd.nju.homework.dao.UserDao"%>
<%@page import="xxd.nju.homework.dao.impl.UserDaoImpl"%>
<%@page import="xxd.nju.homework.model.UserBean"%>
<html lang="zh-cn">

<%
	UserDao userDao = new UserDaoImpl();
	ProjectDao projectDao = new ProjectDaoImpl();
	ArrayList<ProjectBean> projectList = projectDao.getAllProject();
	int currentPage = 1;
	String ss = request.getParameter("currentPage");
	if (ss != null)
		currentPage = Integer.parseInt(ss);
	int pageNum = projectList.size() / 6;
	if (projectList.size() % 6 != 0)
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

<title>Manage Project</title>

<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/admin-main.css" rel="stylesheet">
<style type="text/css"></style>



</head>

<body style="background:#DCDCDC;">

	<div class="container">

		<div class="masthead">
			<h3 class="text-muted">Welcome! <%= result.getUsername() %> ~</h3>
			<ul class="nav nav-justified">
				<!-- <li><a href="/Homework/admin/main.jsp">Home</a></li> -->
				<li><a href="/Homework/admin/main_user.jsp" class="active">Manage User</a></li>
				<li class="active"><a href="/Homework/admin/main_project.jsp">Manage Project</a></li>
			</ul>
		</div>


		<div class="up_content">
			<button type="button" class="btn btn-default btn-lg" 
				onclick="window.location.href='/Homework/admin/main_addProject.jsp'"
				style="float: right;color:#6A5ACD">ADD PROJECT</button>
		</div>

		<div class="content">

			<div class="panel panel-info">

				<%
					if (projectList.size() == 0) {
				%>
				<h1>No Project Is Available !!</h1>
				<%
					} else {
				%>
				<table class="table table-bordered table-striped">
					<tr>
						<th rowspan="2">ProjectID</th>
						<th rowspan="2">HostID</th>
						<th rowspan="2">Budget</th>
						<th rowspan="2">EndDate</th>
						<th rowspan="2">State</th>
						<th colspan="3">SubmitItems</th>
						<th rowspan="2">Delete</th>
						<th rowspan="2">Modify</th>
					</tr>
					<tr>
						
						<th>Food</th>
						<th>Traffic</th>
						<th>Device</th>
						
					</tr>
					<%
						for (int i = 0; i < 6; i++) {
								if (i + (currentPage - 1) * 6 == projectList.size())
									break;
								ProjectBean project = projectList.get(i + (currentPage - 1)
										* 6);
					%>
					<tr>
						<td><%=project.getProjectID()%></td>
						<td><%=project.getProjectHostID()%></td>
						<td><%=project.getBudget()%></td>
						<td><%=project.getProjectDate()%></td>
						<td><%=project.getProjectState()%></td>
						<td><%=project.getSubmitFood()%></td>
						<td><%=project.getSubmitTransportation()%></td>
						<td><%=project.getSubmitDevice()%></td>

						<td width="10px"><button type="button" class="btn btn-danger"
								onclick="window.location.href='/Homework/admin/deleteproject?deleteProjectID=<%=i + (currentPage - 1) * 6%>&currentPage=<%=currentPage%>'">DELETE</button></td>
						<td width="10px"><button type="button" class="btn btn-info"
								onclick="window.location.href='/Homework/admin/modifyproject?modifyProjectID=<%=i + (currentPage - 1) * 6%>'">MODIFY</button></td>
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
						href="/Homework/admin/main_project.jsp?currentPage=<%=currentPage - 1%>">&laquo;</a></li>
					<%
						} else {
					%>
					<li><a href="/Homework/admin/main_project.jsp?currentPage=1">&laquo;</a></li>
					<%
						}
					%>
					<%
						int i = 1;
						for (; i <= pageNum; i++) {
					%>

					<li><a
						href="/Homework/admin/main_project.jsp?currentPage=<%=i%>"><%=i%></a></li>

					<%
						}
					%>
					<%
						if (currentPage < pageNum) {
					%>
					<li><a
						href="/Homework/admin/main_project.jsp?currentPage=<%=currentPage + 1%>">&raquo;</a></li>
					<%
						} else {
					%>
					<li><a
						href="/Homework/admin/main_project.jsp?currentPage=<%=pageNum%>">&raquo;</a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>

		<!-- Site footer -->
		<div class="footer">
			<p style="text-align:center">© xxd 2013</p>
		</div>

	</div>

</body>
</html>