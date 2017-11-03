<%@page import="connection.DConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>
<html>
<head>

<meta http-equiv='Content-Type' content='text/html; charset=ISO-8859-1'>
<title>Recruiter</title>
<link href='bootsrap_css/bootstrap.css' rel='stylesheet' type='text/css' media='all' />
<link href='bootsrap_css/bootstrap.min.css' rel='stylesheet' type='text/css' media='all' />
<link href='bootsrap_css/bootstrap-theme.css' rel='stylesheet' type='text/css' media='all' />
<link href='bootsrap_css/bootstrap-theme.min.css' rel='stylesheet' type='text/css' media='all' />
<link href='css/font-awesome.css' rel='stylesheet' type='text/css' media='all' />
<link href='common_style/style.css' rel='stylesheet' type='text/css' media='all' />
<script src=js/jquery-2.1.4.min.js>
</script>
 <!-- here some code by shubham sharma -->
<!-- this code for back button  -->
<script type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</script>



<script type="text/javascript">
    function noBack() {
    	window.history.forward(); 
    	}
    noBack();
    window.onload = noBack;
    window.onpageshow = function (evt) {
    	if (evt.persisted) noBack(); 
    	}
    window.onunload = function () {
    	void (0);
    	}
</script>


<style>
body {
    background-image: url('./images/Trabaajo_Login_BG.jpg');
    /*width: 100%;
    height: 100%;*/
    background-repeat: no-repeat;
    /* background-attachment: fixed;
    background-position: center;*/
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}
</style>

</head>
<body  onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">
<div class='row'>
<div class='col-xs-12'>
<div class='login1'>

<!-- <button type=button class=sigin>REGISTER AS CANDIDATE</button>
<button type=button class=register>REGISTER AS RECUIRTER</button> -->

<script>
	$(document).ready(function(){
		//console.log(Intl.DateTimeFormat().resolvedOptions().timeZone);
		$("#country").val (Intl.DateTimeFormat().resolvedOptions().timeZone);
	});
</script>


<%
	String login_message = (String)session.getAttribute("recruiterLoginMessage");
	/* System.out.println("[Inside JSP] login_message --> " + login_message );

	if( login_message == null ){
		login_message = null;
	} */
	
	Connection conn=null;
	conn=DConnection.getConnection();
    
    System.out.println("Succefully connected on Login 1");
    
	String email_id=request.getParameter("userid");
	System.out.println(email_id);
	
	String sql="UPDATE `recruiter` SET  `recruiter_status` =1 WHERE  `recruiter_email` = '"+email_id+"'";
	System.out.println(sql);
	  PreparedStatement p=conn.prepareStatement(sql);
	  int i=p.executeUpdate();
%>

<br><br>
<form name='f1' method="POST" action="recruiterLogin">
<% if( login_message!= null ){ %>
<div class="alert alert-danger alert-dismissable">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong><span class="glyphicon glyphicon-alert"></span></strong> <%=login_message %>
</div>
<%} %>
<div class='form-group'>
		    <input type='text' class='form-control formborder compnayemail' id='email' name='email' placeholder='Email id' pattern='[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$' title='Please enter valid email id' style='width:300px;' required>
		  </div>
		  <div class='form-group'>
		    <!-- <input type='password' class='form-control formborder compnaypass' id='password' name='password' pattern='.{8}' title='Only 8 digit valid' placeholder='password' style='width:300px;' required> -->
		    <!-- Here some change by shubham sharma -->
		    <input type='password' class='form-control formborder compnaypass' id='password' name='password' minlength="8"  maxlength="15" title=' 6-15 digit valid' placeholder='password' style='width:300px;' required>
		    <input type="hidden" name="country" id="country" value="">
		  </div>
          <a href="#" class="h6" style="text-decoration:none;">Forget Your Password ?</a><br>
		  <button type='submit' class='btn btn-danger' style='width:300px; margin-top:5px;'>Login</button>
</form>
<p class="h5">If you are not register ? <a href="Recruiter_register.jsp" style="color:#ff3333; text-decoration:none;">Register</a></p>
												 
</div>
</div>
</div>
</body>
</html>