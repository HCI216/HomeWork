<%@page import="xxd.nju.homework.dao.UserDao" %>
<%@page import="xxd.nju.homework.dao.impl.UserDaoImpl" %>
<%@page import="xxd.nju.homework.model.UserBean" %>
<%@page import="java.util.*" %>
<html lang="zh-cn">

<%
     UserBean userbean = (UserBean) request.getAttribute("modifyuser");
     String userRow = request.getParameter("modifyUserID");
     int row = 0;
     if(userRow != null) row = Integer.parseInt(userRow);
%>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Homework</title>

<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/bootstrap-theme.css" rel="stylesheet">
<link href="../css/modifyuser.css" rel="stylesheet">
<style type="text/css"></style>
</head>


<body>
	<form class="form-modify" method="post"
		action="/Homework/admin/modifyuser?modifyUserID=<%=row%>">
		<div class="form-group">
			<label for="username">UserName</label> <input id="username"
				type="text" name="username" class="form-control"
				placeholder="<%= userbean.getUsername()%>">
		</div>
		<div class="form-group">
			<label for="password">Password</label> <input id="password"
				type="password" name="password" class="form-control"
				placeholder="<%= userbean.getPassword()%>">
		</div>
		<div class="form-group">
			<label for="comfirmpassword">Comfirm Password</label> <input
				id="comfirmpassword" type="password" name="comfirmpassword"
				class="form-control" placeholder="comfirm you new password">
		</div>
		<div class="form-group">
		    <label for="cardNumber">CardNumber</label>
			<input id="cardNumber" type="text" name="cardNumber" class="form-control"
				placeholder="<%= userbean.getCardNumber()%>">
		</div>
		<select name="identity" class="form-control">
			<option value="admin">admin</option>
			<option value="normaluser">normaluser</option>
			<option value="financer">financer</option>
			<option value="financeManager">financeManager</option>
		</select> <br>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Modify</button>
	</form>

</body>
</html>