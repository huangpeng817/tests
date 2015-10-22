<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content=",keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<SCRIPT LANGUAGE="javascript">
<!--

function DaoRu()
{
	var id=$("#store").val();
	var name=$("#store :selected").text();
window.open ("<%=basePath%>huoliu?m=daoru&s_id="+id+"&s_name="+name,'newwindow','height=600,width=800,top=100,left=100,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')
}
-->
</SCRIPT>
<SCRIPT LANGUAGE="javascript">
<!--

function daochu()
{
	var id=$("#store").val();
	var name=$("#store :selected").text();
window.open ("<%=basePath%>huoliu?m=daochu&s_id="+id+"&s_name="+name,'newwindow','height=500,width=800,top=100,left=100,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')
}
-->
</SCRIPT>



<!-- The styles -->
<link id="bs-css" href="<%=basePath%>css/bootstrap-cerulean.min.css"
	rel="stylesheet">

<link href="<%=basePath%>css/charisma-app.css" rel="stylesheet">
<link
	href='<%=basePath%>bower_components/fullcalendar/dist/fullcalendar.css'
	rel='stylesheet'>
<link
	href='<%=basePath%>bower_components/fullcalendar/dist/fullcalendar.print.css'
	rel='stylesheet' media='print'>
<link href='<%=basePath%>bower_components/chosen/chosen.min.css'
	rel='stylesheet'>
<link
	href='<%=basePath%>bower_components/colorbox/example3/colorbox.css'
	rel='stylesheet'>
<link
	href='<%=basePath%>bower_components/responsive-tables/responsive-tables.css'
	rel='stylesheet'>
<link
	href='<%=basePath%>bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css'
	rel='stylesheet'>
<link href='<%=basePath%>css/jquery.noty.css' rel='stylesheet'>
<link href='<%=basePath%>css/noty_theme_default.css' rel='stylesheet'>
<link href='<%=basePath%>css/elfinder.min.css' rel='stylesheet'>
<link href='<%=basePath%>css/elfinder.theme.css' rel='stylesheet'>
<link href='<%=basePath%>css/jquery.iphone.toggle.css' rel='stylesheet'>
<link href='<%=basePath%>css/uploadify.css' rel='stylesheet'>
<link href='<%=basePath%>css/animate.min.css' rel='stylesheet'>
<link href="<%=basePath%>css/bootstrap-datetimepicker.css"
	rel="stylesheet">
<link href="<%=basePath%>css/jquery.dataTables.min.css" rel="stylesheet">

<!-- jQuery -->
<script src="<%=basePath%>bower_components/jquery/jquery.min.js"></script>

<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- The fav icon -->
<link rel="shortcut icon" href="<%=basePath%>img/favicon.ico">

<!-- external javascript -->

<script
	src="<%=basePath%>bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- library for cookie management -->
<script src="<%=basePath%>js/jquery.cookie.js"></script>
<!-- calender plugin -->
<script src='<%=basePath%>bower_components/moment/min/moment.min.js'></script>
<script
	src='<%=basePath%>bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script src='<%=basePath%>js/jquery.dataTables.min.js'></script>

<!-- select or dropdown enhancer -->
<script src="<%=basePath%>bower_components/chosen/chosen.jquery.min.js"></script>
<!-- plugin for gallery image view -->
<script
	src="<%=basePath%>bower_components/colorbox/jquery.colorbox-min.js"></script>
<!-- notification plugin -->
<script src="<%=basePath%>js/jquery.noty.js"></script>
<!-- library for making tables responsive -->
<script
	src="<%=basePath%>bower_components/responsive-tables/responsive-tables.js"></script>
<!-- tour plugin -->
<script
	src="<%=basePath%>bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
<!-- star rating plugin -->
<script src="<%=basePath%>js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="<%=basePath%>js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="<%=basePath%>js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="<%=basePath%>js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="<%=basePath%>js/jquery.history.js"></script>
<!-- application script for Charisma demo -->
<script src="<%=basePath%>js/charisma.js"></script>
<script src="<%=basePath%>js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath%>js/bootstrap-datetimepicker.zh-CN.js"
	charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
	
		$("#search").click(function(){
			var store=$("#store").val();
			var number=$("#category").val();
			var currentPage=null;
			if(store==null){
				alert("请重新选择店铺！");
				return;
			}
			$("#supplierdiv").empty();
			$.post("<%=basePath%>huoliu", {
				"m" : "supplierInfo",
				"s_id" : store,
				"catagory" :number  ,
				"currentPage":currentPage,
			}, function(data) {
				$("#supplierdiv").append(data);
			}, "html");
			
		});
		
		//新增供货商
		$("#addsupplier").click(function(){
			var message="";
			var s_id=$("#store").val();
			var s_name=$("#store :selected").text();
			
			if(store==null){
				alert("请重新选择店铺！");
				return;
			}
			
			$("#supplierdiv").empty();
		
				
			$.post("<%=basePath%> huoliu",{
				"m" : "addsupplier",
				"s_id" :s_id,
				"s_name" :s_name  ,
				"message" :message,
				
			}, function(data) {
				$("#supplierdiv").append(data);
			}, "html");
			
		});
		
		
	});
</script>
</head>

<body>
<div id="supplierdiv">
	
	<button type="button" id="addsupplier" class="btn btn-success"
		name="submit" >新增商品</button>
	&nbsp;&nbsp;
	<button type="button" class="btn btn-success" name="submit"
		onclick="DaoRu()">导入</button>
	&nbsp;&nbsp;
	<button type="button" class="btn btn-success" name="submit"
		onclick="daochu()">导出</button>
	
	<select id="store" class="singleSelector">
		<!-- <option value="-1" selected="selected" disabled="disabled">选择店铺</option> -->

		<%
			List<Object[]> list = (List<Object[]>) request.getAttribute("storeList");
			if (list != null && list.size() != 0) {
				for (Object[] obj : list) {
		%>
		<option value='<%=obj[0]%>'><%=obj[1]%></option>
		<%
			}
			}
		%>

	</select>

	<select id="category">
		<option value="0" selected="selected">有效单据</option>
		<option value="1">作废单据</option>
	</select>

	<div style="float: right;">
		<input class="input-medium search-query" type="text" float:right /> <input
			type="button" value="查询" id="search" class="submitBtn" />
		<button type="button" class="btn btn-success" float:right>按分类</button>
	</div>
	
	<div data-spy="scroll"
		style="width: 100%; overflow: auto; position: relative;"
		data-offset="10">
     

		
		<table style="width:1200px; height:30px;  table-layout:fixed;" border="1" ;>
		<thead>
			<tr>
				<th>操作</th>
				<th>编号</th>
				<th>名称</th>
				<th>联系人</th>
				<th>电话</th>
				<th>邮箱</th>
				<th>授权状态</th>
			</tr>
		</thead>
		<tbody>
		<%
			List<Object[]> supplier = (List<Object[]>) request.getAttribute("list");

			String s_id = request.getParameter("s_id").toString();
			
			if (supplier != null && supplier.size() > 0) {
				for (int i = 0; i < supplier.size(); i++) {
		%>
		<tr>
			<td> <a href="<%=basePath%>huoliu?m=editSupplier
			&su_number=<%=supplier.get(i)[0]%>&su_name=<%=supplier.get(i)[1]%>
			&su_contacter=<%=supplier.get(i)[2]%>&su_phone=<%=supplier.get(i)[3]%>
			&su_email=<%=supplier.get(i)[4]%>&su_empower=<%=supplier.get(i)[5]%>
			&su_id=<%=supplier.get(i)[6]%>&s_id=<%=supplier.get(i)[7]%>">编辑</a>
				
			<%
				for (int j = 0; j <= 5; j++) {
			%>
			<td><%=supplier.get(i)[j]%></td>
			<%
				}
			%>
		</tr>
		<%
			}
			}
		%>
	</tbody>

	</table>
		</div>

	</div>


</body>

</html>