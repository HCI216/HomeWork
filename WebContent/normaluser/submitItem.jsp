<html lang="zh-cn">

<%@page import="xxd.nju.homework.dao.ProjectDao"%>
<%@page import="xxd.nju.homework.dao.impl.ProjectDaoImpl"%>
<%@page import="xxd.nju.homework.model.ProjectBean"%>
<%
	ProjectBean project = (ProjectBean) request.getAttribute("project");
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
			action="/Homework/normaluser/submit?submitproject=<%=project.getProjectID() %>">
			<%
				if (project.getSubmitFood().equals("NO")) {
			%>
			<div class="form-group">
				<label for="food">Food</label> <input id="food" type="text"
					name="food" class="form-control"
					placeholder="input the submit money" readonly="readonly">
			</div>
			<%
				} else {
			%>
			<div class="form-group">
				<label for="food">Food</label> <input id="food" type="text"
					name="food" class="form-control"
					placeholder="input the submit money">
			</div>

			<%
				}
			    if(project.getSubmitTransportation().equals("NO")){
			%>
			<div class="form-group">
				<label for="transportation">Transportation</label> <input
					id="transportation" type="text" name="transportation"
					class="form-control" placeholder="input the submit money" readonly="readonly">
			</div>
			<%
			    }else{
			%>
			
			<div class="form-group">
				<label for="transportation">Transportation</label> <input
					id="transportation" type="text" name="transportation"
					class="form-control" placeholder="input the submit money">
			</div>
			<%
			    }
			    if(project.getSubmitDevice().equals("NO")){
			%>
			<div class="form-group">
				<label for="device">Device</label> <input id="device" type="text"
					name="device" class="form-control"
					placeholder="input the submit money" readonly="readonly">
			</div>
			<%
			    }else{
			%>
			
			<div class="form-group">
				<label for="device">Device</label> <input id="device" type="text"
					name="device" class="form-control"
					placeholder="input the submit money">
			</div>
			<%
			    }
			%>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
		</form>
		<div class="footer">
			<p>© xxd 2014</p>
		</div>
	</div>

</body>
</html>