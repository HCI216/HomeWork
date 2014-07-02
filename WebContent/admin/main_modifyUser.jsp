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

<script>
function validation() {
	if(document.getElementById("username").value==""){
		alert("please fill the username!");
		document.getElementById("username").focus();
		return false;
	}else if(document.getElementById("password").value==""){
		alert("please fill the password!");
		document.getElementById("password").focus();
		return false;
	}else if(document.getElementById("confirmPassword").value==""){
		alert("please fill the confirmPassword!");
		document.getElementById("confirmPassword").focus();
		return false;
	}else if(document.getElementById("cardNumber").value==""){
		alert("please fill the cardNumber!");
		document.getElementById("cardNumber").focus();
		return false;
	}else {
		return true;
	}
}
</script>
</head>


<body style="background:#DCDCDC;">
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
				id="confirmpassword" type="password" name="comfirmpassword"
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
	<button class="btn btn-lg btn-primary btn-block form-modify"
		style="height:45px;width:300px;"
		onClick="window.location.href('main_user.jsp')">Back</button>

</body>
</html>