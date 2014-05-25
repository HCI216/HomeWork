<html lang="zh-cn">
<%@page import="xxd.nju.homework.dao.UserDao"%>
<%@page import="xxd.nju.homework.dao.impl.UserDaoImpl"%>
<%@page import="xxd.nju.homework.model.UserBean"%>
<%@page import="java.util.*"%>
<%
	UserDao userDao = new UserDaoImpl();
   ArrayList<UserBean> userList = userDao.getAllUser();
   ArrayList<Double> moneyList = new ArrayList<Double>();
   for (int i = 0;i<userList.size();i++){
	   UserBean userBean  = userList.get(i);
	   moneyList.add(userDao.getSubmitMoney(userBean.getUserID()));
   }
   String users = "";
   String moneys = "";
   for (int i = 0;i<userList.size();i++){
	   UserBean user = userList.get(i);
	   if(i == 0){
		   users += "[" + "'" + user.getUserID() +"'";
		   moneys += ("[" + moneyList.get(i));
	   }else{
		   users += ","+"'"+user.getUserID()+"'";
		   moneys += ("," + moneyList.get(i));
	   }
   }
   users += "]";
   moneys += "]";
   moneyList = new ArrayList<Double>();
   for (int i = 0;i<userList.size();i++){
	   UserBean userBean  = userList.get(i);
	   moneyList.add(userDao.getUseMoney(userBean.getUserID()));
   }
   String users1 = "";
   String moneys1 = "";
   for (int i = 0;i<userList.size();i++){
	   UserBean user = userList.get(i);
	   if(i == 0){
		   users1 += "[" + "'" + user.getUserID() +"'";
		   moneys1 += ("[" + moneyList.get(i));
	   }else{
		   users1 += ","+"'"+user.getUserID()+"'";
		   moneys1 += ("," + moneyList.get(i));
	   }
   }
   users1 += "]";
   moneys1 += "]";
   System.out.println(users);
   System.out.println(moneys);
   
		   System.out.println(users1);
    System.out.println(moneys1);
    
 //  moneys = "[34.4, 21.8, 20.1, 20, 19.6, 19.5, 19.1, 18.4, 18,17.3, 16.8, 15, 14.7, 14.5, 13.3, 12.8, 12.4, 11.8,11.7, 11.2]";
  // users = "['Tokyo','Jakarta','New York','Seoul','Manila','Mumbai','Sao Paulo','Mexico City','Dehli','Osaka','Cairo','Kolkata','Los Angeles','Shanghai','Moscow','Beijing','Buenos Aires','Guangzhou','Shenzhen','Istanbul']";
%>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Homework</title>
<script type="text/javascript" src="../jquery/jquery-1.8.3.min.js"></script>


<script type="text/javascript">
	var userpp =<%=users1%>;
	var moneypp =<%=moneys1%>;
	$(function() {
		$('#chart2').highcharts({
			chart : {
				type : 'column',
				margin : [ 50, 50, 100, 80 ]
			},
			title : {
				text : 'Submit Money Every Person'
			},
			xAxis : {
				categories : userpp,
				labels : {
					rotation : -45,
					align : 'right',
					style : {
						fontSize : '13px',
						fontFamily : 'Verdana, sans-serif'
					}
				}
			},
			yAxis : {
				min : 0,
				title : {
					text : 'Money(Yuan)'
				}
			},
			legend : {
				enabled : false
			},
			tooltip : {
				pointFormat : 'Submit Money: <b>{point.y:.1f}</b>',
			},
			series : [ {
				name : 'UserID',
				data : moneypp,
				dataLabels : {
					enabled : true,
					rotation : -90,
					color : '#FFFFFF',
					align : 'right',
					x : 4,
					y : 10,
					style : {
						fontSize : '13px',
						fontFamily : 'Verdana, sans-serif',
						textShadow : '0 0 3px black'
					}
				}
			} ]
		});
	});
</script>

<script type="text/javascript">
	var userpp =
<%=users%>
	;
	var moneypp =
<%=moneys%>
	;
	$(function() {
		$('#chart1').highcharts({
			chart : {
				type : 'column',
				margin : [ 50, 50, 100, 80 ]
			},
			title : {
				text : 'Submit Money Every Person'
			},
			xAxis : {
				categories : userpp,
				labels : {
					rotation : -45,
					align : 'right',
					style : {
						fontSize : '13px',
						fontFamily : 'Verdana, sans-serif'
					}
				}
			},
			yAxis : {
				min : 0,
				title : {
					text : 'Money(Yuan)'
				}
			},
			legend : {
				enabled : false
			},
			tooltip : {
				pointFormat : 'Submit Money: <b>{point.y:.1f}</b>',
			},
			series : [ {
				name : 'UserID',
				data : moneypp,
				dataLabels : {
					enabled : true,
					rotation : -90,
					color : '#FFFFFF',
					align : 'right',
					x : 4,
					y : 10,
					style : {
						fontSize : '13px',
						fontFamily : 'Verdana, sans-serif',
						textShadow : '0 0 3px black'
					}
				}
			} ]
		});
	});
</script>

<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/admin-main.css" rel="stylesheet">
<style type="text/css"></style>
</head>

<body>


	<script src="../js/js/highcharts.js"></script>
	<script src="../js/js/modules/exporting.js"></script>

	<div class="container">

		<div class="masthead">
			<h3 class="text-muted">Welcome!</h3>
			<ul class="nav nav-justified">
				<li><a href="/Homework/financeManager/main.jsp">Home</a></li>
				<li><a href="/Homework/financeManager/main_user.jsp">User</a></li>
				<li><a href="/Homework/financeManager/main_project.jsp">Project</a></li>
				<li class="active"><a
					href="/Homework/financeManager/main_statistics.jsp">Statistics</a></li>
			</ul>
		</div>
		<div class="content">
			<!-- 
			<div class="form-group">
				<label for="chart1">1. Submit Money every person</label>
				<div id="chart1"
					style="min-width: 500px; height: 400px; margin: 0 auto"></div>
			</div>
			
			 -->
			<div class="form-group">
				<label for="chart2">1. Submit Money every person</label>
				<div id="chart2"
					style="min-width: 500px; height: 400px; margin: 0 auto"></div>
			</div>
		</div>

		<!-- Site footer -->
		<div class="footer">
			<p>© xxd 2013</p>
		</div>

	</div>

</body>
</html>