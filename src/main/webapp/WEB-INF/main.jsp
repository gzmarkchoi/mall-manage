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

<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function b() {
	}

	function add_tab(url, title) {
		// add a new tab panel  
		var panelExists = $('#tt').tabs('exists', title);
		if (!panelExists) {
			$('#tt').tabs('add', {
				title : title,
				href : url,
				closable : true,
				tools : [ {
					iconCls : 'icon-mini-refresh',
					handler : function() {
						alert('refresh');
					}
				} ]
			});
		} else {
			$('#tt').tabs('select', title);
		}

	}

	function add_tab_ajax(url, title) {
		// add a new tab panel    
		$.post(url, function(data) {
			$('#tt').tabs('add', {
				title : title,
				content : data,
				closable : true,
				tools : [ {
					iconCls : 'icon-mini-refresh',
					handler : function() {
						alert('refresh');
					}
				} ]
			});
		});
	}
</script>
<title>gmall</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height: 60px; background: #B3DFDA; padding: 10px">north region</div>
	<div data-options="region:'west',split:true,title:'West'" style="width: 230px; padding: 10px;">
		<div class="easyui-accordion" style="width: 200px;">
			<div title="Admin 1" data-options="iconCls:'icon-ok'">
				<ul>
					<li><a href="javascript:add_tab('goto_spu.do','SPU Admin')">SPU admin</a></li>
					<li><a href="javascript:add_tab('goto_attr.do', 'Product properties admin')">Product properties admin</a></li>
					<li><a href="javascript:add_tab('goto_sku.do', 'SKU Admin')">SKU admin</a></li>
				</ul>
			</div>
			<div title="Admin 2" data-options="iconCls:'icon-ok'">
				<ul>
					<li>Product cache Admin</li>
				</ul>
			</div>
		</div>
	</div>
	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width: 100px; padding: 10px;">east region</div>
	<div data-options="region:'south',border:false" style="height: 50px; background: #A9FACD; padding: 10px;">south region</div>
	<div data-options="region:'center',title:'Center'">
		<div id="tt" class="easyui-tabs" style="height: 500px"></div>
	</div>

</body>
</html>