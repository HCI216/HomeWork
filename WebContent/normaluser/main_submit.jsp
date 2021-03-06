<html lang="zh-cn">
<%@page import="xxd.nju.homework.dao.SubmitItemDao"%>
<%@page import="xxd.nju.homework.dao.impl.SubmitItemDaoImpl"%>
<%@page import="xxd.nju.homework.service.SubmitItemService"%>
<%@page import="xxd.nju.homework.service.impl.SubmitItemServiceImpl"%>
<%@page import="xxd.nju.homework.dao.ParticipateDao"%>
<%@page import="xxd.nju.homework.dao.impl.ParticipateDaoImpl"%>
<%@page import="xxd.nju.homework.service.ParticipateService"%>
<%@page import="xxd.nju.homework.service.impl.ParticipateServiceImpl"%>

<%@page import="xxd.nju.homework.dao.UserDao"%>
<%@page import="xxd.nju.homework.dao.impl.UserDaoImpl"%>
<%@page import="xxd.nju.homework.service.UserService"%>
<%@page import="xxd.nju.homework.service.impl.UserServiceImpl"%>
<%@page import="java.util.*"%>
<%@page import="xxd.nju.homework.model.SubmitItemBean"%>
<%@page import="xxd.nju.homework.dao.ProjectDao"%>
<%@page import="xxd.nju.homework.dao.impl.ProjectDaoImpl"%>
<%@page import="xxd.nju.homework.model.ProjectBean"%>

<%
	String userId = (String) request.getSession().getAttribute(
			"loginNormalUser");
	SubmitItemDao submitItemDao = new SubmitItemDaoImpl();
	UserDao userDao = new UserDaoImpl();
	ParticipateDao participateDao = new ParticipateDaoImpl();
	ProjectDao projectDao = new ProjectDaoImpl();
	ArrayList<SubmitItemBean> itemList = submitItemDao
			.getSubmitItemByID(userId);

	int currentPage = 1;
	String ss = request.getParameter("currentPage");
	if (ss != null)
		currentPage = Integer.parseInt(ss);
	int pageNum = itemList.size() / 6;
	if (itemList.size() % 6 != 0)
		pageNum++;
	String userName = userDao.getNameByID((String) request.getSession()
			.getAttribute("loginNormalUser"));
%>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Submit Items</title>

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
				<li><a href="/Homework/normaluser/main_participate.jsp">Participate
						Projects</a></li>
				<li class="active"><a
					href="/Homework/normaluser/main_submit.jsp">SubmittedItems</a></li>
				<li><a href="/Homework/normaluser/main_check.jsp">NeedToCheck</a></li>

			</ul>
		</div>
		<div class="content">
			<div class="panel panel-info">

				<%
					if (itemList.size() == 0) {
				%>
				<!-- TODO -->
				<h1>No SubmitItem Is Available !!</h1>
				<%
					} else {
				%>
				<table class="table table-bordered table-striped">
					<tr>
						<th>SubmitItemID</th>
						<th>ProjectID</th>
						<th>HostName</th>
						<th>Item</th>
						<th>SubmitMoney</th>
						<th>State</th>
					</tr>
					<%
						for (int i = 0; i < 6; i++) {
								if (i + (currentPage - 1) * 6 == itemList.size())
									break;
								SubmitItemBean item = itemList.get(i + (currentPage - 1)
										* 6);
								String userID = participateDao.getParticipateByID(
										item.getParticipateID()).getUserID();
								String projectID = participateDao.getParticipateByID(
										item.getParticipateID()).getProjectID();

								ProjectBean project = projectDao.getProjectByID(projectID);
								String hostID = project.getProjectHostID();
								String hostName = userDao.getNameByID(hostID);
					%>
					<tr>
						<td><%=item.getSubmitItemID()%></td>
						<td><%=projectID%></td>
						<td><%=hostName%>(<%=hostID%>)</td>
						<td><%=item.getSubmitItem()%></td>
						<td><%=item.getUseMoney()%></td>
						<%
							if (item.getSubmitState().equals("SUCCESS")) {
						%>
						<td>SUCCESS</td>
						<%
							} else if (item.getSubmitState().equals("REWRITE")) {
						%>
						<td>FAIL</td>
						<%
							} else {
						%>
						<td>SUBMITING</td>
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
						href="/Homework/normaluser/main_submit.jsp?currentPage=<%=currentPage - 1%>">&laquo;</a></li>
					<%
						} else {
					%>
					<li><a
						href="/Homework/normaluser/main_submit.jsp?currentPage=1">&laquo;</a></li>
					<%
						}
					%>
					<%
						int i = 1;
						for (; i <= pageNum; i++) {
					%>

					<li><a
						href="/Homework/normaluser/main_submit.jsp?currentPage=<%=i%>"><%=i%></a></li>

					<%
						}
					%>
					<%
						if (currentPage < pageNum) {
					%>
					<li><a
						href="/Homework/normaluser/main_submit.jsp?currentPage=<%=currentPage + 1%>">&raquo;</a></li>
					<%
						} else {
					%>
					<li><a
						href="/Homework/normaluser/main_submit.jsp?currentPage=<%=pageNum%>">&raquo;</a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
		<div class="footer">
			<p style="text-align: center">� xxd 2013</p>
		</div>
	</div>
</body>
</html>