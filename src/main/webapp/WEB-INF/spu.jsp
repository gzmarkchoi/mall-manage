<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Gmall</title>
</head>
<body>
	SPU admin
	<hr>
	Level 1:
	<select id="class_1_select" onchange="get_class_2(this.value);"><option>Please select</option></select> Level 2:
	<select id="class_2_select"><option>Please select</option></select> Brand:
	<select id="tm_select"><option>Please select</option></select> Find
	<br>
	<a href="javascript:goto_spu_add();">Add</a>
	<br> Delete
	<br> Edit
	<br>
	
	<script type="text/javascript">
		$(function() {
			$.getJSON("js/json/class_1.js", function(data) {
				$(data).each(function(i, json) {
					$("#class_1_select").append("<option value=" + json.id + ">" + json.flmch1 + "</option>");
				});
			});
		});
	
		function get_class_2(class_1_id) {
			$.getJSON("js/json/class_2_" + class_1_id + ".js", function(data) {
				$("#class_2_select").empty();
				$(data).each(function(i, json) {
					$("#class_2_select").append("<option value=" + json.id + ">" + json.flmch2 + "</option>");
				});
			});
	
			get_tm(class_1_id);
		}
	
		function get_tm(class_1_id) {
			$.getJSON("js/json/tm_class_1_" + class_1_id + ".js", function(data) {
				$("#tm_select").empty();
				$(data).each(function(i, json) {
					$("#tm_select").append("<option value=" + json.id + ">" + json.ppmch + "</option>");
				});
			});
		}
	
		function goto_spu_add() {
			var class_1_id = $("#class_1_select").val();
			var class_2_id = $("#class_2_select").val();
			var tm_id = $("#tm_select").val();
	
			window.location.href = "goto_spu_add.do?flbh1=" + class_1_id + "&flbh2=" + class_2_id + "&pp_id=" + tm_id;
		}
	</script>
</body>
</html>