<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<base href="<%=basePath %>">
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript">
			function b(){}
		</script>
		<title>gmall</title>
	</head>
	<body>
		Admin home
		<hr>
		<a href="goto_spu.do" target="_blank">Product information admin</a><br>
		<a href="goto_attr.do" target="_blank">Product properties admin</a><br>
		Product stock admin<br>
		Product buffer stock admin<br>
		
	</body>
</html>