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

<%
	String userId = (String) request.getSession().getAttribute(
			"loginFinancer");
	SubmitItemDao submitItemDao = new SubmitItemDaoImpl();
	UserDao userDao = new UserDaoImpl();
	ParticipateDao participateDao = new ParticipateDaoImpl();
	ArrayList<SubmitItemBean> items = submitItemDao.getAllSubmitItem();
	ArrayList<SubmitItemBean> itemList = new ArrayList<SubmitItemBean>();
	for (int i = 0; i < items.size(); i++) {
		if (items.get(i).getSubmitState().equals("FINANCER")) {
			itemList.add(items.get(i));
		}
	}
	int currentPage = 1;
	String ss = request.getParameter("currentPage");
	if (ss != null)
		currentPage = Integer.parseInt(ss);
	int pageNum = itemList.size() / 6;
	if (itemList.size() % 6 != 0)
		pageNum++;
%>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Check</title>

<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/admin-main.css" rel="stylesheet">
<style type="text/css"></style>
</head>

<body>

	<div class="container">
		<div class="masthead">
			<h3 class="text-muted">Welcome!</h3>
			<ul class="nav nav-justified">
				<li><a href="/Homework/financer/main_user.jsp">User Info</a></li>
				<li><a href="/Homework/financer/main_project.jsp">Project
						Info</a></li>
				<li class="active"><a href="/Homework/financer/main_check.jsp">NeedToCheck</a></li>
			</ul>
		</div>
		<div class="content">
			<div class="panel panel-info">

				<%
					if (itemList.size() == 0) {
				%>
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
						<th>confirm</th>
						<th>cancel</th>
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
								String userName = userDao.getNameByID(userID);
					%>
					<%
						if (item.getSubmitState().equals("FINANCER")) {
					%>
					<tr>
						<td><%=item.getSubmitItemID()%></td>
						<td><%=projectID%></td>
						<td><%=userName%>(<%=userID%>)</td>
						<td><%=item.getSubmitItem()%></td>
						<td><%=item.getUseMoney()%></td>
						<%
							if (!(item.getSubmitState().equals("SUCCESS") || item
												.getSubmitState().equals("REWRITE"))) {
						%>
						<td width="10px"><button type="button" class="btn btn-info"
								onclick="window.location.href='/Homework/financer/financerconfirm?participateID=<%=item.getParticipateID()%>&submitItem=<%=item.getSubmitItem()%>'">comfirm</button></td>
						<td width="10px"><button type="button" class="btn btn-info"
								onclick="window.location.href='/Homework/financer/financercancel?participateID=<%=item.getParticipateID()%>&submitItem=<%=item.getSubmitItem()%>'">cancel</button></td>
						<%
							} else {
						%>
						<td width="10px"><button type="button" disabled="disabled"
								class="btn btn-info"
								onclick="window.location.href='/Homework/financer/financerconfirm?participateID=<%=item.getParticipateID()%>&submitItem=<%=item.getSubmitItem()%>'">comfirm</button></td>
						<td width="10px"><button type="button" disabled="disabled"
								class="btn btn-info"
								onclick="window.location.href='/Homework/financer/financercancel?participateID=<%=item.getParticipateID()%>&submitItem=<%=item.getSubmitItem()%>'">cancel</button></td>

						<%
							}
						%>
					</tr>
					<%
						}
					%>
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
						href="/Homework/financer/main_check.jsp?currentPage=<%=currentPage - 1%>">&laquo;</a></li>
					<%
						} else {
					%>
					<li><a href="/Homework/financer/main_check.jsp?currentPage=1">&laquo;</a></li>
					<%
						}
					%>
					<%
						int i = 1;
						for (; i <= pageNum; i++) {
					%>

					<li><a
						href="/Homework/financer/main_check.jsp?currentPage=<%=i%>"><%=i%></a></li>

					<%
						}
					%>
					<%
						if (currentPage < pageNum) {
					%>
					<li><a
						href="/Homework/financer/main_check.jsp?currentPage=<%=currentPage + 1%>">&raquo;</a></li>
					<%
						} else {
					%>
					<li><a
						href="/Homework/financer/main_check.jsp?currentPage=<%=pageNum%>">&raquo;</a></li>
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