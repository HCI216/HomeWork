<html lang="zh-cn">
<%@page import="xxd.nju.homework.model.UserBean"%>
<%@page import="xxd.nju.homework.dao.ProjectDao"%>
<%@page import="xxd.nju.homework.dao.impl.ProjectDaoImpl"%>
<%@page import="xxd.nju.homework.model.ProjectBean"%>
<%@page import="java.util.*"%>
<%
	String userID = (String) request.getSession().getAttribute(
			"loginNormalUser");
	ProjectDao projectDao = new ProjectDaoImpl();
	ArrayList<ProjectBean> projectList = projectDao
			.getParticipateProjectList(userID);
	int currentPage = 1;
	String ss = request.getParameter("currentPage");
	if (ss != null)
		currentPage = Integer.parseInt(ss);
	int pageNum = projectList.size() / 6;
	if (projectList.size() % 6 != 0)
		pageNum++;
%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Participate Project</title>

<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/admin-main.css" rel="stylesheet">
<style type="text/css"></style>
</head>

<body>

	<div class="container">

		<div class="masthead">
			<h3 class="text-muted">Welcome!</h3>
			<ul class="nav nav-justified">
				<li><a href="/Homework/normaluser/main_host.jsp">Host
						Projects</a></li>
				<li class="active"><a
					href="/Homework/normaluser/main_participate.jsp">Participate
						Projects</a></li>
				<li><a href="/Homework/normaluser/main_submit.jsp">SubmittedItems</a></li>
				<li><a href="/Homework/normaluser/main_check.jsp">NeedToCheck</a></li>

			</ul>
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
						<th rowspan="2">projectID</th>
						<th rowspan="2">Budget</th>
						<th rowspan="2">EndDate</th>
						<th rowspan="2">State</th>
						<th colspan="3">SubmitItems</th>
						<th rowspan="2">SubmitItem</th>
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
						<td><%=project.getBudget()%></td>
						<td><%=project.getProjectDate()%></td>
						<td><%=project.getProjectState()%></td>
						<td><%=project.getSubmitFood()%></td>
						<td><%=project.getSubmitTransportation()%></td>
						<td><%=project.getSubmitDevice()%></td>

						<%
							if (project.getSubmitDevice().equals("NO")
											&& project.getSubmitFood().equals("NO")
											&& project.getSubmitTransportation().equals("NO")) {
						%>
						<td style="width: 30px"><button type="button"
								disabled="disabled" class="btn btn-info btn-lg">Submit</button></td>
						<%
							} else {
						%>
						<td style="width: 30px"><button type="button"
								class="btn btn-info btn-lg"
								onclick="window.location.href='/Homework/normaluser/submitItem?submitProjectID=<%=i + (currentPage - 1) * 6%>&userID=<%=userID%>'">Submit</button></td>
						<%
							}
						%>
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
			<p style="text-align: center">© xxd 2013</p>
		</div>

	</div>

</body>
</html>