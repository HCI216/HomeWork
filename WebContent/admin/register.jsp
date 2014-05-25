<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Homework</title>

<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/bootstrap-theme.css" rel="stylesheet">
<link href="../css/register.css" rel="stylesheet">
<style type="text/css"></style>
</head>


<body>
	<form class="form-register" method="post"
		action="/Homework/admin/register">
		<h1>Register</h1>
		<input type="text" name="username" class="form-control"
			placeholder="input your username"> <input type="password"
			name="password" class="form-control" placeholder="password">
		<input type="password" name="comfirmpassword" class="form-control"
			placeholder="comfirm you password"> <input type="text"
			name="cardNumber" class="form-control"
			placeholder="input your card number">
		 <select name="identity" class="form-control">
			<option value="admin">admin</option>
			<option value="normaluser">normaluser</option>
			<option value="financer">financer</option>
			<option value="financeManager">financeManager</option>
		</select> <br>

		<button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
	</form>

</body>
</html>