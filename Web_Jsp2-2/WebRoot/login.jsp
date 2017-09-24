<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<%=request.getAttribute("msg")%>
  	
  	
  	<%
  		//接受服务器的状态码
		String status = String.valueOf(request.getAttribute("status"));
  		
  		//使用request获取本地cookie
  		Cookie [] toArray=request.getCookies();
 		String username="";//默认的用户名
 		String userpwd="";//默认的密码 		
 		for(Cookie cook:toArray){
 			if("username".equals(cook.getName())){
 				username=cook.getValue();
 			}else if("userpwd".equals(cook.getName())){
 				userpwd=cook.getValue();
 			}
 		}
 		//阻止死循环
		if(!status.equals("500")){
			//需要发送的连接
			String url = "serverLogin.jsp?logName="+username+"&logPwd="+userpwd;
			request.getRequestDispatcher(url).forward(request, response);
		}
 		
  	 %>
  	
    <form action="serverLogin.jsp" method="post">
     		<label>用户名:<input name="logName" value="<%=username%>"></label><br>
    		<label>密码:<input name="logPwd" type="password" value="<%=userpwd%>"></label><br>
    		<button type="submit">登录</button>
    </form>
    
    	<button onclick="javascript:localation.href='register.jsp'">注册</button>
<!--     <button onclick="register.jsp">注册</button>
 -->  </body>
</html>
