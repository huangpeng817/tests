<%@ page language="java" import="java.util.*,org.uestc.util.PageObject"
	pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>



<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>ååä¿¡æ¯åæ</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="åå,ä¿¡æ¯,åæ">
<meta http-equiv="description" content="ååä¿¡æ¯åæé¡µé¢">
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
						$('#datetimepicker_analyze_1').datetimepicker({
							        format: 'yyyy-mm-dd hh:ii:ss',
							        autoclose:true,
							        language:'zh-CN'
							});
						$('#datetimepicker_analyze_2').datetimepicker({
							        format: 'yyyy-mm-dd hh:ii:ss',
							        autoclose:true,
							        language:'zh-CN'
							});
							
						$('#zxt_store').change(function(){
							var store=$(this).val();
							$.post('<%=basePath %>AnalyzeGoods',{"store":store,"m":"getCategoty"},function(data){
							
							},"json");
						});
						
});

</script>

</head>

<body>
	<div class="panel panel-default">
		<div class="panel-body">
			<div style="float:left;width:15%;">
				<h4>ååä¿¡æ¯åæ</h4>
			</div>
			<div style="float:right;width:85%;">

				<div class="btn-group">

					<select id="zxt_store">
						<option selected="selected" disabled="disabled">è¯·éæ©</option>
						<%
							List<Object[]> store = (List<Object[]>) request.getAttribute("store");
							if (store != null && store.size() != 0) {

								for (Object[] obj : store) {
						%>
						<option value="<%=obj[0]%>"><%=obj[1]%></option>
						<%
							}
							}
						%>
					</select> 
					<select id="zxt_category">
							<option selected="selected" value="-1">å¨é¨åç±»</option>
					</select>
				</div>


				<input type="text" value="" id="datetimepicker_analyze_1">è³<input
					type="text" value="" id="datetimepicker_analyze_2"> <input
					type="text" value="æ¡ç /åç§°" id="zxt_num">

				<button type="button" class="btn btn-primary dropdown-toggle"
					id="zxt_search">åæ</button>

			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div style="overflow: scroll;">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>åå</th>
						<th>æ¡å½¢ç </th>
						<th>ååç¶æ</th>
						<!-- <th>ç´¯è®¡è¿è´§</th>
						<th>ç´¯è®¡åºè´§</th>
						<th>ç´¯è®¡éè´§</th>
						<th>ç´¯è®¡éå®</th> -->
						<th>åºå­æ°é</th>
						<th>é¶å®åä»·</th>
						<th>ææ¬åä»·</th>
						<th>å·®ä»·</th>
						<!-- <th>æ¯å©æ¶¦</th> -->
						<th>æè®©æ»é¢</th>
						<th>é¶å®æ»é¢</th>
						<th>é¶å®ææ¬</th>
						<th>åºå­æ»é¢</th>
						<th>çéç³»æ°</th>
					</tr>
				</thead>
				<tbody id="zxt_table">
					<tr>
						<td>Tanmay</td>
						<td>Bangalore</td>
						<td>560001</td>
						<td>Tanmay</td>
						<td>Bangalore</td>
						<td>560001</td>
						<td>Tanmay</td>
						<td>Bangalore</td>
						<td>560001</td>
						<td>Tanmay</td>
						<td>Bangalore</td>
						<td>560001</td>


					</tr>
				</tbody>
			</table>
			<!--è®°å½å½åé¡µæ°  -->
			<input type="hidden" id="zxt_currentPage" value="1">
			<!--æ»è®°å½æ° -->
			<input type="hidden" id="zxt_count" value="0">
			<div>
				<ul class="pagination pagination-lg" style="float: right;"
					id="zxt_page">


					<li><a href="#" onclick="javascript:void(0);">&laquo;</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div>



		</div>
	</div>
</body>
</html>

