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
	function click_image(index){
		$("#file_" + index).click();

	}

	function replace_image(index){
		// get image object
		var blob_image = $("#file_" + index)[0].files[0];
		var url = window.URL.createObjectURL(blob_image);

		// replace image
		$("#image_" + index).attr("src",url);

		var length = $(":file").length;
		
		if((index+1)==length){
			// 用户选择的是最后一张图片
			add_image(index);
		}
	}

	function add_image(index){
		var line_1 = '<div id="d_' + (index+1) + '" style="float:left;margin-left:10px;border:1px red solid;">';
		var line_2 = '<input id="file_' + (index + 1) + '" type="file" name="files" style="display:none;" onchange="replace_image(' + (index + 1) + ')"/>';
		var line_3 = '<img id="image_' + (index + 1) + '" onclick="click_image(' + (index + 1) + ')" style="cursor:pointer;" src="image/upload_hover.png" width="100px">';
		var line_4 = '</div>';

		$("#d_" + index).after(line_1 + line_2 + line_3 + line_4);

	}
</script>
<title>Gmall</title>
</head>
<body>
	spu add information${spu.flbh1}|${spu.flbh2}|${spu.pp_id}
	<hr>
	<form action="spu_add.do" enctype="multipart/form-data" method="post">
		<input type="hidden" name="flbh1" value="${spu.flbh1}"/>
		<input type="hidden" name="flbh2" value="${spu.flbh2}"/>
		<input type="hidden" name="pp_id" value="${spu.pp_id}"/>
		Product name:<input name="shp_mch" type="text" /><br>
		Product description:<textarea name="shp_msh" rows="10" cols="50"></textarea><br>
		Product images:<br>
		<div id="d_0" style="float:left;margin-left:10px;border:1px red solid;">
			<input id="file_0" type="file" name="files" style="display:none;" onchange="replace_image(0)"/>
			<img id="image_0" onclick="click_image(0)" style="cursor:pointer;" src="image/upload_hover.png" width="100px">
		</div>
		
		<input type="submit" value="Submit"/>
	</form>
</body>
</html>