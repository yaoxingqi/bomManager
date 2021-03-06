<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/hui/H-ui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/hui/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/hui/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/hui/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/hui/style.css" />
<!-- _footer 作为公共模版分离出去 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/hui/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/hui/H-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/hui/H-ui.admin.js"></script>
<!-- /_footer 作为公共模版分离出去 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/hui/jquery.contextmenu.r2.js"></script> -->
<title>企业e定制平台</title>

</head>
<body>
<s:form>
	<s:token></s:token>
	<header class="navbar-wrapper">
		
		<div class="navbar navbar-fixed-top">
			<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" >企业e定制平台</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml">H-ui</a> 
				<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
				<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
					<ul class="cl">
						<li class="dropDown dropDown_hover">
							<a href="#" class="dropDown_A">${currentUser.u_Name}<i class="Hui-iconfont">&#xe6d5;</i></a>
							<ul class="dropDown-menu menu radius box-shadow">
							    <li><a href="javascript:;" onClick="changePassword()">修改密码</a></li>
								<li><a href="user-logout.action">退出</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</div>
	</header>
	<aside class="Hui-aside">
		<div class="menu_dropdown bk_2">
				<dt><a data-href="user-list.action" data-title="用户管理" href="javascript:void(0)">用户管理</a></dt>
				<s:if test="#session.currentUser.u_Level > 1">
					<dt><a data-href="material-list" data-title="材料管理" href="javascript:void(0)">材料管理</a></dt>
					<dl id="menu-member">
						<dt><i class="Hui-iconfont"></i>BOM管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
						<dd>
							<ul>
								<li><a data-href="bom-list" data-title="Bom结构查询" href="javascript:;">Bom结构查询</a></li>
								<li><a data-href="bom-normalList" data-title="Bom结构管理" href="javascript:;">Bom结构管理</a></li>
							</ul>
						</dd>
					</dl>
					<dt><a data-href="supplier-list" data-title="供应商管理" href="javascript:void(0)">供应商管理</a></dt>
					<dl id="menu-member">
						<dt><i class="Hui-iconfont"></i> 库存管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
						<dd>
							<ul>
								<li><a data-href="inventory-list" data-title="物料库存管理" href="javascript:;">物料库存管理</a></li>
								<li><a data-href="invlog-list" data-title="出入库记录管理" href="javascript:;">出入库记录管理</a></li>
							</ul>
						</dd>
					</dl>
				</s:if>
				<dl id="menu-member">
					<dt><i class="Hui-iconfont"></i>订单中心<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
					<dd>
						<ul>
							<li><a data-href="order-list" data-title="建立订单" href="javascript:;">建立订单</a></li>
							<s:if test="#session.currentUser.u_Level > 2">
								<li><a data-href="order-verifyList" data-title="订单审核" href="javascript:;">订单审核</a></li>
							</s:if>
							<li><a data-href="order-toManager" data-title="订单管理" href="javascript:;">订单管理</a></li>
							<li><a data-href="order-toReport" data-title="订单报表" href="javascript:;">订单报表</a></li>
							<li><a data-href="order-showSaleman" data-title="联系我们" href="javascript:void(0)">联系我们</a></li>
							<s:if test="#session.currentUser.u_Level > 2">
							<li><a data-href="message-manageMessage" data-title="消息发布" href="javascript:void(0)">消息发布</a></li>
							</s:if>
							<li><a data-href="message-listMessage" data-title="消息浏览" href="javascript:void(0)">消息浏览</a></li>
						</ul>
					</dd>
				</dl>

				<s:if test="#session.currentUser.u_Level > 1">
					<dt><a data-href="executeSql-executeSql" data-title="sql执行页" href="javascript:void(0)">sql执行页</a></dt>
				</s:if>
		</div>
	</aside>
	<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" class="acrossTab cl">
					<li class="active">
						<span title="我的桌面" data-href="">我的桌面</span>
						<em></em>
					</li>
			</ul>
		</div>
			<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
	</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display:none" class="loading"></div>
				<iframe scrolling="yes" frameborder="0" src=""></iframe>
		</div>
	</div>
	</section>

</s:form>
<!-- <div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
</ul>
</div> -->


<!--请在下方写此页面业务相关的脚本-->

<script type="text/javascript">
/*修改密码*/
function changePassword(){
	layer_show('添加供应商','user-toAlterPassword.action','600','600');
}
</script> 


</body>
</html>