<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Administrator Login Page</title>

<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/signin.css" rel="stylesheet">
<style type="text/css"></style>
</head>

<body style="background:#DCDCDC;">

<% String error = (String)request.getSession().getAttribute("error"); %>
   
	<div class="container">
		<form class="form-signin" method="post" action="/Homework/admin/adminlogin">
			<h2 class="form-signin-heading" style="width:1000px">Please sign in (administrator)</h2>
			<input type="text" name="username" class="form-control" placeholder="your username"> 
			<input type="password" name="password" class="form-control" placeholder="Password">
			<% if( error != null) { %>
			<p style="color:red;"><%= error %></p>
			<% } %>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		</form>
		<div class="footer">
        <p style="text-align:center;">© xxd 2014</p>
      </div>
	</div>

</body>
</html>