<%@page import="xxd.nju.homework.dao.UserDao"%>
<%@page import="xxd.nju.homework.dao.impl.UserDaoImpl"%>
<%@page import="xxd.nju.homework.model.UserBean"%>
<%@page import="java.util.*"%>
<html lang="zh-cn">

<%
	UserDao userDao = new UserDaoImpl();
	ArrayList<UserBean> userList = userDao.getAllUser();
%>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Add Project</title>

<style type="text/css"></style>
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/bootstrap-theme.css" rel="stylesheet">
<link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet"
	media="screen">
<link href="../css/addproject.css" rel="stylesheet">
<link rel="stylesheet"
	href="../css/ui-lightness/jquery-ui-1.10.4.custom.css">

<script>
	function validation() {
		if (document.getElementById("budget").value == "") {
			alert("please fill the budget!");
			document.getElementById("budget").focus();
			return false;
		} else if (document.getElementById("datepicker").value == "") {
			alert("please fill the date!");
			document.getElementById("datepicker").focus();
			return false;
		} else {
			return true;
		}
	}
</script>
</head>

<body style="background: #DCDCDC;">
	<form class="form-addproject" method="post"
		onSubmit="return validation();" action="/Homework/admin/addProject">
		<div class="form-group">
			<label for="hostID">HostID</label> <select id="hostID" name="hostID"
				class="form-control">
				<%
					for (int i = 0; i < userList.size(); i++) {
																		UserBean user = userList.get(i);
																		if(!user.getPosition().equals("normaluser")) continue;
				%>
				<option value="<%=user.getUserID()%>"><%=user.getUserID()%></option>
				<%
					}
				%>
			</select>
		</div>
		<div class="form-group">
			<label for="budget">Budget</label> <input id="budget" type="text"
				name="budget" class="form-control" placeholder="Budget">
		</div>
		<div class="form-group">
			<label for="datepicker">End Date</label> <input class="form-control"
				type="text" name="projectDate" id="datepicker" />
		</div>
		<div class="form-group">
			<label for="SubmitItem">Submit Items</label> <label id="SubmitItem"
				class="form-control"> <input type="checkbox" value=""
				name="food"> food <br> <input type="checkbox" value=""
				name="transportation"> transportation <br> <input
				type="checkbox" value="" name="device"> device
			</label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Add</button>
	</form>
	<button class="btn btn-lg btn-primary btn-block form-addproject"
		style="height: 45px; width: 300px;"
		onClick="window.location.href('main_project.jsp')">Back</button>
	<script src="../js/jquery-1.10.2.js"></script>
	<script src="../js/jquery-ui-1.10.4.custom.js"></script>

	<script>
		$(function() {
			$("#datepicker").datepicker();
		});
	</script>

</body>

</html>