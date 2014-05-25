<html lang="zh-cn">
<%@page import="xxd.nju.homework.dao.UserDao"%>
<%@page import="xxd.nju.homework.dao.impl.UserDaoImpl"%>
<%@page import="xxd.nju.homework.model.UserBean"%>
<%@page import="java.util.*"%>
<%
	String userId = (String) request.getSession().getAttribute(
			"loginNormalUser");
	UserDao userDao = new UserDaoImpl();
	String projectID = request.getParameter("projectID");
	ArrayList<UserBean> userList = userDao.getUserNotTakePart(
			projectID, userId);
%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Homework</title>

<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/signin.css" rel="stylesheet">
<style type="text/css"></style>
</head>

<body>

	<div class="container">
		<form class="form-signin" method="post"
			action="/Homework/normaluser/addParticipate?projectID=<%=projectID%>">
			<%
				if (userList.size() == 0) {
			%>
			<h1>No User is Available</h1>
			<%
				} else {
			%>
			<div class="form-group">
				<label for="userID">UserID</label> <select name="userID"
					class="form-control">

					<%
						{
								for (int i = 0; i < userList.size(); i++) {
									UserBean user = userList.get(i);
					%>
					<option value="<%=i%>"><%=user.getUserID() + "   ,  "
								+ user.getUsername()%></option>

					<%
						}
					%>
				</select> <br>
				<%
					}
					}
				%>
			</div>
			<div class="form-group">
				<label for="GiveMoney">GiveMoney</label> <input class="form-control"
					type="text" name="giveMoney" id="GiveMoney" />
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">ADD</button>
		</form>
		<div class="footer">
			<p>© xxd 2014</p>
		</div>
	</div>

</body>
</html>