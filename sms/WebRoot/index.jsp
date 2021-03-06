<%@page import="org.uestc.util.Utils"%>
<%@page import="com.mysql.jdbc.Util"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%
	if(null==session.getAttribute("sessionUser")){
		response.sendRedirect("login.html");
	}
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>超市管理系统</title>

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
	href='bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css'
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
<link href="<%=basePath%>css/jquery.dataTables.min.css"
	rel="stylesheet">

<!-- jQuery -->
<script src="<%=basePath%>bower_components/jquery/jquery.min.js"></script>

<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="<%=basePath%>http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
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
		/********************************************************/
		//销售管理
		/*start  */
		$('#spxxfx').click(function(){
			$('iframe').attr('src','<%=basePath%>AnalyzeGoods?m=analyzeGoods');
		});
		$('#kcyd').click(function(){
			$('iframe').attr('src','<%=basePath %>InventoryWarningServlet?method=findByUid');
		});
		$('#zbtj').click(function(){
			$('iframe').attr('src','<%=basePath%>ZBTJServlet?method=initLoad');
		});
		$('#spxs').click(function(){
			$('iframe').attr('src','<%=basePath%>SPXSServlet?method=initLoad');
		});
		$('#xsdj').click(function(){
			$('iframe').attr('src','<%=basePath%>XSDJServlet?method=initLoad');
		});
		$('#qsfx').click(function(){
			$('iframe').attr('src','<%=basePath%>QSFXServlet?method=initLoad');
		});
		$('#rjjl').click(function(){
			$('iframe').attr('src','<%=basePath%>RJJLServlet?method=initLoad');
		});
		$('#yygk').click(function(){
			$('iframe').attr('src','<%=basePath%>YYGKServlet?method=initLoad');
		});
		/*end  */
		/**********************************************************************/
		//ly
		/* start */
		$('#spzl').click(function(){
			$('iframe').attr('src','<%=basePath %>goods?m=goodsInfo&s_id=1&g_del=1'
					);
			
		});  
		$('#ghs').click(function(){
			$('iframe').attr('src',"<%=basePath %>huoliu?m=supplierInfo&s_id=1&s_del=1&key=");
		
			
		});  
		$('#hlgl').click(function(){
			$('iframe').attr('src','<%=basePath %>huoliu?m=hlgl');
			
		});  
		$('#ghsjs').click(function(){
			$('iframe').attr('src','<%=basePath %>huoliu?m=ghsjs');
			
		}); 
		$('#hkhz').click(function(){
			$('iframe').attr('src','<%=basePath %>huoliu?m=hkhz');
			
		});
		$('#spfl').click(function(){
			
			$('iframe').attr('src','<%=basePath %>CategoryGoods?type=initPage');
		});
		$('#hkhz').click(function(){
			$('iframe').attr('src','<%=basePath %>huoliu?m=hkhz');
		});
		$('#addList').click(function(){
			$('iframe').attr('src','<%=basePath %>addOrder?m=all');
		});
		$('#addOrderRemote').click(function(){
			$('iframe').attr('src','<%=basePath %>addOrder?m=addOrderRemote');
		});
		/* end */
		/*start*/
		//营销
	 	$('.mbt_indexcfg').click(function(){
			var type=$(this).attr('id');
			$('iframe').empty();
			$('iframe').attr('src','<%=basePath %>marketing?type='+type);
		});
		/*end*
		/***************************************************************************/

		/*start*/
		//商品模块的批量设置
	 	//批量设置
		//批量设置
		$('#plsz').click(function(){
			$('iframe').attr('src','<%=basePath %>BatchGoods?type=init');
		});

		//会员资料
		$('#hyzl').click(function(){
			$('iframe').attr('src','<%=basePath %>MemberInform?type=init');
		});
		
		//会员等级
		$('#hydj').click(function(){
			$('iframe').attr('src','<%=basePath %>membergrape?type=init');
		});

		//收银员业绩
		$('#syyyj').click(function(){
			$('iframe').attr('src','<%=basePath %>EmpleePeformance?type=init');
		});

		//员工资料（收银员资料）
		$('#syyzl').click(function(){
			$('iframe').attr('src','<%=basePath %>EmpleeDateInform?type=init');
		});
		
		//*******************************
		//交接班记录
		$('#jjbjl').click(function(){
			$('iframe').attr('src','<%=basePath %>shmem_jiaojieban?type=init');
		});
		//********************************
		//会员购买查询
		$('#hygmjl').click(function(){
			$('iframe').attr('src','<%=basePath %>shbuychaxun?type=init');
		});
		//充值明细
		$('#czmx').click(function(){
			$('iframe').attr('src','<%=basePath %>moneydetails?type=init');
		});
		/*管理员审核*/
		$('#auditOrder').click(function(){
			$('iframe').attr('src','<%=basePath %>AuditOrderServlet?method=initLoad');
		});
		
		$('#addGood').click(function(){
			$('iframe').attr('src','<%=basePath %>www/basic.jsp');
		});
		
		$('#addGoodInfo').click(function(){
			$('iframe').attr('src','<%=basePath %>www/good-base.jsp');
		});
		
		$('#addUser').click(function(){
			$('iframe').attr('src','<%=basePath %>www/add-user.jsp');
		});
		$('#mergeOrder').click(function(){
			$('iframe').attr('src','<%=basePath %>MergeOrderServlet?method=initLoad');
		});
		/****************************************************************************/
		
		$("li a").click(
		function() {
			var parent = $(this).attr("data-options");
			var child = $(this).text();
			var title = $(".breadcrumb");
			title.empty();
			title.append(" <li><a href=\"#\">收银系统</a></li><li><a href=\"#\">"
							+ parent
							+ "</a></li><li><a href=\"#\">"
							+ child + "</a></li>");

		});

	 	$(".accordion-toggle").click(
		function() {

			var text = $(this).text();
			var title = $(".breadcrumb");
			title.empty();
			title.append(" <li><a href=\"#\">收银系统</a></li><li><a href=\"#\">"
							+ text + "</a></li>");

		}); 
	});
	
</script>
</head>

<body>

	<!-- topbar starts -->
	<div class="navbar navbar-default" role="navigation">

		<div class="navbar-inner">
			<button type="button" class="navbar-toggle pull-left animated flip">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp"> <img
				alt="Charisma Logo" src="img/logo20.png" class="hidden-xs" /> <span>收银系统</span></a>

			<!-- user dropdown starts -->
			<div class="btn-group pull-right">
				<button class="btn btn-default dropdown-toggle"
					data-toggle="dropdown">
					<i class="glyphicon glyphicon-user"></i><span
						class="hidden-sm hidden-xs"> 系统</span> <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#" data-options='用户'>资料</a></li>
					<li class="divider"></li>
					<li><a href="<%=basePath%>login">退出</a></li>
				</ul>
			</div>
			<!-- user dropdown ends -->

			<!-- theme selector starts -->
			<div class="btn-group pull-right theme-container animated tada">
				<!-- <button class="btn btn-default dropdown-toggle"
					data-toggle="dropdown">
					<i class="glyphicon glyphicon-tint"></i><span
						class="hidden-sm hidden-xs"> 更换主题 / 皮肤</span> <span class="caret"></span>
				</button> -->
				<ul class="dropdown-menu" id="themes">

					<li><a data-value="cerulean" href="#"><i
							class="whitespace"></i> Cerulean</a></li>

					<li><a data-value="slate" href="#"><i class="whitespace"></i>
							Slate</a></li>

				</ul>
			</div>


		</div>
	</div>
	<!-- topbar ends -->
	<div class="ch-container">
		<div class="row">
			<!-- left menu starts -->
			<div class="col-sm-2 col-lg-2">
				<div class="sidebar-nav">

					<div class="nav-canvas">
						<div class="panel-group" id="accordion2">
							<div class="panel-heading">
								<strong style="font-size: 30px;">收银系统</strong>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" data-toggle="collapse"
									data-parent="#accordion2" href="#collapseOne">
									<a class="accordion-toggle">销售</a>
								</div>
								<div id="collapseOne" class="panel-collapse collapse"
									style="height: 0px;">
									<div class="panel-body">
										<ul class="nav nav-pills nav-stacked">
											<li><a href="#" data-options="销售" id="yygk">营业概况</a></li>
											<li><a href="#" data-options="销售" id="xsdj">销售单据</a></li>
											<li><a href="#" data-options="销售" id="rjjl">日结记录</a></li>
											<li><a href="#" data-options="销售" id="qsfx">趋势分析</a></li>
											<li><a href="#" data-options="销售" id="zbtj">占比统计</a></li>
											<li><a href="#" data-options="销售" id="spxs">商品销售统计</a></li>
											<!-- <li><a href="#" data-options="销售" id="djpl">单据评论</a></li> -->
											<!-- <li><a href="#" data-options="销售" id="zktj">折扣统计</a></li> -->
										</ul>
									</div>
								</div>
							</div>

							<div class="panel panel-default">
								<div class="panel-heading" data-toggle="collapse"
									data-parent="#accordion2" href="#collapseTwo">
									<a class="accordion-toggle">商品</a>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse"
									style="height: 0px;">
									<div class="panel-body">
										<ul class="nav nav-pills nav-stacked">
											<li><a href="#" data-options="商品" id="spzl">商品资料</a></li>
											<li><a href="#" data-options="商品" id="spfl">商品分类</a></li>
											<li><a href="#" data-options="商品" id="plsz">批量设置</a></li>
											<li><a href="#" data-options="商品" id="kcyd">库存预警</a></li>
											<!-- <li><a href="#" data-options="商品" id="spck">商品查看</a></li> -->
											<!-- <li><a href="#" data-options="商品" id="spxxfx">商品信息分析</a></li>
											<li><a href="#" data-options="商品" id="kcpdjl">库存盘点记录</a></li>
											<li><a href="#" data-options="商品" id="kcbdjl">库存变动记录</a></li>
											<li><a href="#" data-options="商品" id="zzcf">组装拆分</a></li>
											<li><a href="#" data-options="商品" id="ckgl">次卡管理</a></li>
											<li><a href="#" data-options="商品" id="yxjggl">优先价格管理</a></li>
											<li><a href="#" data-options="商品" id="spbs">商品报损</a></li>
											<li><a href="#" data-options="商品" id="bsjl">报损记录</a></li>
											<li><a href="#" data-options="商品" id="bstj">报损统计</a></li> -->
										</ul>
									</div>
								</div>
							</div>

							<div class="panel panel-default">
								<div class="panel-heading" data-toggle="collapse"
									data-parent="#accordion2" href="#collapseThree">
									<a class="accordion-toggle">会员</a>
								</div>
								<div id="collapseThree" class="panel-collapse collapse"
									style="height: 0px;">
									<div class="panel-body">
										<ul class="nav nav-pills nav-stacked">
											<li><a href="#" data-options="会员" id="hyzl">会员资料</a></li>
											<li><a href="#" data-options="会员" id="hydj">会员等级</a></li>
											<!-- <li><a href="#" data-options="会员" id="hybz">会员报账</a></li> -->
											<li><a href="#" data-options="会员" id="czmx">充值明细</a></li>
											<li><a href="#" data-options="会员" id="hygmjl">会员购买查询</a></li>
											<!-- <li><a href="#" data-options="会员" id="fsdx">发送短信</a></li>
											<li><a href="#" data-options="会员" id="dxjl">短信记录</a></li>
											<li><a href="#" data-options="会员" id="jfzd">积分制度</a></li> -->
										</ul>
									</div>
								</div>
							</div>

							<div class="panel panel-default">
								<div class="panel-heading" data-toggle="collapse"
									data-parent="#accordion2" href="#collapseFour">
									<a class="accordion-toggle">营销</a>
								</div>
								<div id="collapseFour" class="panel-collapse collapse"
									style="height: 0px;">
									<div class="panel-body">
										<ul class="nav nav-pills nav-stacked">
											<li><a href="#"  class="mbt_indexcfg" data-options="营销" id="dzytj">打折与特价</a></li>
											<li><a href="#"  class="mbt_indexcfg" data-options="营销" id="dzcx">搭赠促销</a></li>
											<li><a href="#"  class="mbt_indexcfg" data-options="营销" id="hgcx">换购促销</a></li>
											<li><a href="#"  class="mbt_indexcfg" data-options="营销" id="dejdz">第二件打折</a></li>
											<li><a href="#"  class="mbt_indexcfg" data-options="营销" id="tccx">套餐促销</a></li>
											<li><a href="#"  class="mbt_indexcfg" data-options="营销" id="mefx">优惠券</a></li>
											
											<li><a href="#"  class="mbt_indexcfg" data-options="营销" id="cxspb">促销商品表</a></li>
											<li><a href="#"  class="mbt_indexcfg" data-options="营销" id="lscxb">历史促销表</a></li>
										</ul>
									</div>
								</div>
							</div>

							<div class="panel panel-default">
								<div class="panel-heading" data-toggle="collapse"
									data-parent="#accordion2" href="#collapseFive">
									<a class="accordion-toggle">员工</a>
								</div>
								<div id="collapseFive" class="panel-collapse collapse"
									style="height: 0px;">
									<div class="panel-body">
										<ul class="nav nav-pills nav-stacked">
											<li><a href="#" data-options="员工" id="syyzl">收银员资料</a></li>
											<li><a href="#" data-options="员工" id="syyyj">收银员业绩</a></li>
											<li><a href="#" data-options="员工" id="jjbjl">交接班记录</a></li>
											<!-- <li><a href="#" data-options="员工" id="dgyzl">导购员资料</a></li>
											<li><a href="#" data-options="员工" id="dgyyj">导购员业绩</a></li>
											<li><a href="#" data-options="员工" id="dgmx">导购明细</a></li> -->
										</ul>
									</div>
								</div>
							</div>

							<div class="panel panel-default">
								<div class="panel-heading" data-toggle="collapse"
									data-parent="#accordion2" href="#collapseSix">
									<a class="accordion-toggle">订单</a>
								</div>
								<div id="collapseSix" class="panel-collapse collapse"
									style="height: 0px;">
									<div class="panel-body">
										<ul class="nav nav-pills nav-stacked">
											<!-- <li><a href="#" data-options="订单" id="ghs">供货商</a></li> -->
											<!-- <li><a href="#" data-options="订单" id="mddh">门店订货</a></li> -->
											<!-- <li><a href="#" data-options="订单" id="hlgl">订单管理</a></li>
											<li><a href="#" data-options="订单" id="ghsjs">供货商结算</a></li>
											<li><a href="#" data-options="订单" id="hkhz">货款汇总</a></li> -->
											<li><a href="#" data-options="订单" id="addList">新增订单（从本地仓库选择）</a></li>
											<li><a href="#" data-options="订单" id="addOrderRemote">新增订单（从远程仓库选择）</a></li>
										</ul>
									</div>
								</div>
							</div>

							<%if(1==Utils.findUTypeByUId(session.getAttribute("uid"))) {%>
							<div class="panel panel-default">
								<div class="panel-heading" data-toggle="collapse"
									data-parent="#accordion2" href="#collapseEight">
									<a class="accordion-toggle">管理员</a>
								</div>
								<div id="collapseEight" class="panel-collapse collapse"
									style="height: 0px;">
									<div class="panel-body">
										<ul class="nav nav-pills nav-stacked">
											<!-- <li><a href="#" data-options="管理员" id="addGood">商品添加模板</a></li> -->
											<li><a href="#" data-options="管理员" id="addGoodInfo">商品资料</a></li>
											<li><a href="#" data-options="管理员" id="addUser">用户管理</a></li>
											<!-- <li><a href="#" data-options="管理员">调货单审核</a></li>--->
											<li><a href="#" data-options="管理员" id="auditOrder">订货单审核</a></li>
											<li><a href="#" data-options="管理员" id="mergeOrder">订货单合并</a></li>
											<!--
											<li><a href="#" data-options="管理员">调货单审核</a></li>
											<li><a href="#" data-options="管理员"></a></li>
											<li><a href="#" data-options="管理员">XXXX</a></li>
											<li><a href="#" data-options="管理员">XXXX</a></li> -->
										</ul>
									</div>
								</div>
							</div>
							<%} %>
						</div>
					</div>

				</div>
			</div>
			<!--/span-->
			<!-- left menu ends -->

			<!-- <noscript>
				<div class="alert alert-block col-md-12">
					<h4 class="alert-heading">Warning!</h4>

					<p>
						You need to have <a href="http://en.wikipedia.org/wiki/JavaScript"
							target="_blank">JavaScript</a> enabled to use this site.
					</p>
				</div>
			</noscript> -->

			<!--要修改的地方  -->
			<ul class="breadcrumb">
				<li><a href="#">收银系统</a></li>
				<li><a href="#">商品</a></li>
			</ul>


			<div id="content" class="col-lg-10 col-sm-10">
				<div>
					<iframe src="<%=basePath%>welcome.jsp" width="100%"
						height="530px;" style="border: 5px; margin: 0; padding: 0;"></iframe>
				</div>
			</div>
			<!--/.fluid-container-->
		</div>
	</div>
</body>
</html>