<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Add User</title>

<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/bootstrap-theme.css" rel="stylesheet">
<link href="../css/register.css" rel="stylesheet">
<style type="text/css"></style>

<script>
	function validation() {
		if (document.getElementById("username").value == "") {
			alert("please fill the username!");
			document.getElementById("username").focus();
			return false;
		} else if (document.getElementById("password").value == "") {
			alert("please fill the password!");
			document.getElementById("password").focus();
			return false;
		} else if (document.getElementById("confirmPassword").value == "") {
			alert("please fill the confirmPassword!");
			document.getElementById("confirmPassword").focus();
			return false;
		} else if (document.getElementById("cardNumber").value == "") {
			alert("please fill the cardNumber!");
			document.getElementById("cardNumber").focus();
			return false;
		} else {
			return true;
		}
	}
</script>
</head>


<body style="background: #DCDCDC;">
	<div>
		<form class="form-register" method="post"
			action="/Homework/admin/register" onSubmit="return validation();">
			<h1>New User</h1>
			<input type="text" name="username" class="form-control" id="username"
				placeholder="input your username"> <input type="password"
				name="password" id="password" class="form-control"
				placeholder="password"> <input type="password"
				name="comfirmpassword" class="form-control" id="confirmPassword"
				placeholder="confirm you password"> <input type="text"
				name="cardNumber" id="cardNumber" class="form-control"
				placeholder="input your card number"> <select
				name="identity" class="form-control">
				<option value="admin">admin</option>
				<option value="normaluser">normaluser</option>
				<option value="financer">financer</option>
				<option value="financeManager">financeManager</option>
			</select> <br>

			<button class="btn btn-lg btn-primary btn-block" type="submit">Add</button>

		</form>
		<button class="btn btn-lg btn-primary btn-block form-register" style="height:45px;width:300px;"
			onClick="window.location.href('main_user.jsp')">Back</button>
	</div>
</body>
</html>