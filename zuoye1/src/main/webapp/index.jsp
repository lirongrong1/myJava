<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-1.10.1.js"></script>
<script type="text/javascript"
	src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/angular.min.js"></script>
<script type="text/javascript">
	//创建模块
	var app = angular.module("app", []);
	app.controller("MyController", [ "$scope", "$http",
			function($scoep, $http) {
			//pageNum的默认值
			var pageNum=1;
			//pageSize的默认值
			var pageSize=2;
			//status的默认值
			var status=0;
			//order的默认值
			var order=0;
				$scope.toPage = function(num) {
					$http({
						method : "POST",
						url : "${pageContext.request.contextPath}/user/select?pageNum="+num
					}).then(function successCallback(response) {
					alert(response.data)
						$scope.pageInfo = response.data;
						$scope.ss = $scope.pageInfo.list;
						// 请求成功执行代码
					}, function errorCallback(response) {
					alert("shibai ")
						// 请求失败执行代码
					});
				};
				$scope.toPage(1,pageSize,status,order);
			}]);
</script>
</head>

<body ng-app="app" ng-controller="MyController">

	<!-- <div class="modal fade bs-example-modal-sm" tabindex="-1" id="delModal" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
     <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">是否确认删除?</h4>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" ng-click="qr()">确认</button>
      </div>
    </div>
  </div>
</div> -->
	<center>
		<h1>我的邮箱页面</h1>
		<select ng-click="select()">
			<option value="1">未读邮件</option>
			<option value="2">已读邮件</option>
		</select>
		<table border="1">
			<tr>
				<td>
					<button type="button"
						class="btn btn-default glyphicon glyphicon-user"></button>
				</td>
				<td>
					<button type="button" class="btn btn-success" ng-click="a()">批量设为已读</button>
				</td>
				<td>
					<button type="button" class="btn btn-danger" ng-click="delAll()">批量删除</button>
				</td>
				<td>
					<button type="button" class="btn btn-primary" ng-click="desc()">按时间升序排列</button>
				</td>
				<td>
					<button type="button" class="btn btn-info" ng-click="asc()">按时间降序排列</button>
				</td>
			</tr>
			<tr>
				<td><input type="checkbox" ng-click="ck()" ng-checked="flag"></td>
				<td>发件人</td>
				<td>阅读状态</td>
				<td>邮件标题</td>
				<td>发送时间</td>
			</tr>
			<tr ng-repeat="s in ss">
				<td><input type="checkbox" class="comm" ng-click="cks()"
					value="{{s.id}}"></td>
				<td>{{s.person}}</td>
				<td><div ng-if="s.status==1" value="1">
						<span class="glyphicon glyphicon-envelope"></span>
					</div>
					<div ng-if="s.status==2" value="2">
						<span class="glyphicon glyphicon-ok"></span>
					</div></td>
				<td>{{s.title}}</td>
				<td>{{s.date}}</td>
			</tr>
		</table>

		<ul class="pagination">
			总条数:{{pageInfo.total}}
			<li ng-show="d.hasPreviousPage"><a href="javascript:void(0)">&laquo;</a></li>
			<li ng-hide="d.hasPreviousPage"><a href="javascript:void(0)">首页</a></li>
			<li class="active" ng-show="d.navigatepageNums"><a
				href="javascript:void(0)">1</a></li>
			<li class="disabled"><a href="javascript:void(0)">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li ng-show="d.hasNextPage"><a href="javascript:void(0)">尾页</a></li>
			<li><a href="#">&raquo;</a></li>
		</ul>
	</center>
	<form action="user/update" id="form">
		<input name="ids" type="hidden" id="ids">
	</form>
</body>

</html>
