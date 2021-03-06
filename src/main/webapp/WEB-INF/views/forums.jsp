<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="../templates/head-meta.jsp"%>

</head>

<script>
	var myApp = angular.module("myApp", []);
 	myApp.factory("ForumService", ForumService);
	ForumService.$inject = [ "$http", "$q" ];
	function ForumService($http, $q) {
		var BASE_URL = 'http://localhost:9080/gossipgirl/';
		var service = {};
		
		service.postForum = postForum;
		service.listForum = listForum;
		service.postComment = postComment;
		service.listComments = listComments;
		return service;
		
		function postForum(item){
			return $http.post(BASE_URL+"postforum",item).then(function(response) {
				return response.data;
			}, function(errResponse) {
				return $q.reject(errResponse);
			});
		}
		
		function listForum(){
			return $http.get(BASE_URL+"getforums").then(function(response){
				return response.data;
			}, function(errResponse){
				return $q.reject(errResponse);
			});
		}
		
		function postComment(item){
			return $http.post(BASE_URL+"postcomment",item).then(function(response){
				return response.data;
			}, function(errResponse){
				return $q.reject(errResponse);
			});
		}
		
		function listComments(){
			return $http.get(BASE_URL+"listforumcomments").then(function(response){
				return response.data;
			}, function(errResponse){
				return $q.reject(errResponse);
			});
		}
		
		
		
	} 
	myApp.controller("myCtrl", myCtrl);
	myCtrl.$inject = ["$scope", "ForumService" ];
	function myCtrl( $scope, ForumService) {
		
		$scope.postForum = postForum;
		$scope.listForum = listForum;
		$scope.postComment = postComment;
		
		listForum();
		listComments();
	
		//post Forum 
	 	function postForum() {
			console.log("in the post forum");
			$scope.PostForum = {
				ForumTitle : $scope.user.forumTitle,
			};
			
			console.log($scope.PostForum);
			ForumService.postForum($scope.PostForum).then(function(response) {
				$scope.status = response.status;
			}, function(errorResponse) {
				console.log("error Fatching data");
				$scope.error = "Something went wrong";
			});
		} 
		
		//list Forum
		function listForum(){
			console.log("in the list forum");
			ForumService.listForum().then(function(response){
				$scope.forums = response;
			}, function(errResponse){
				console.log("error fatching data");
				$scope.error = "Something went wrong";
			});
		}
		
		
		//post comment
		function postComment(post){
			console.log("in the post comment");
			this.PostComment = {
					  ForumID : $scope.selectedForum,
					 Comment : post.comment
				};
			console.log(this.PostComment);
			ForumService.postComment(this.PostComment).then(function(response){
				$scope.status = response;
				listComments();
			}, function(errResponse){
				console.log("error fatching data");
				$scope.error = "Something went wrong";
			});
		}
		
		//list Comments
		function listComments(){
			console.log("in the list comment");
			ForumService.listComments().then(function(response){
				$scope.comments = response; 
			}, function(errResponse){
				console.log("error fatching data");
				$scope.error = "Something went wrong";
			});
		}
		
		//set the current forum id 
		$scope.setForumId = function(forumId) {
			$scope.selectedForum = forumId;
		}
		
		
	}
</script>

<body ng-app="myApp" ng-controller="myCtrl">

	<%@ include file="../templates/head.jsp"%>


	<div class="container">
		<div ng-show="status">
			<p class="alert alert-info">
				<i class="fa fa-check-circle" aria-hidden="true"></i>&nbsp;{{status}}<br />
			</p>
		</div>
		<div ng-show="error">
			<p class="alert alert-danger">
				<i class="fa fa-exclamation-circle" aria-hidden="true"></i>&nbsp;{{error}}<br />
			</p>
		</div>

		<!--
		Create Forum
	  	-->

		<security:authorize access="hasRole('ROLE_USER')">

			<div class=col-md-12>
				<div class="col-md-4 col-md-offset-4">
					<button type="button" class="btn btn-danger btn-block"
						data-toggle="modal" data-target="#myForum">Create Forum</button>
				</div>
			</div>

			<!-- Modal for cerate blog -->
			<div class="modal fade" id="myForum" role="dialog">
				<div class="modal-dialog modal-md">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Create Forum</h4>
						</div>
						<div class="modal-body">
							<form name="forum">

								<div class="form-group"
									ng-class="{ 'has-error': forum.title.$dirty && forum.title.$error.required }">

									<div class="input-group" style="margin-top: 20px">
										<span class="input-group-addon"><i class="fa fa-pencil"
											aria-hidden="true"></i></span> <input type="text"
											class="form-control" name="title" id="title"
											placeholder="Enter title" ng-model="user.forumTitle" required autofocus>

									</div>
									<span
										ng-show="forum.title.$dirty && forum.title.$error.required"
										class="help-block">Required</span>
								</div>


								<div class="modal-footer" style="margin-top: 20px">
									<input type="submit" ng-click="postForum()" value="Post"
										class="btn btn-primary" data-dismiss="modal"
										ng-disabled="forum.title.$error.required">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</security:authorize>
		
		
		<!-- 
		List Forums
		 -->
		
		<h2>Forums</h2>
		
		<div class="panel-group" ng-show="forums">
			
			<div class="panel panel-default" ng-repeat="forum in forums | orderBy:'forumdate':true"
					style="margin-top: 40px">
					
					<div class="panel-body">
						<h3>{{forum.title}}</h3>
						<hr>
						<b>POSTED ON:</b>  {{forum.forumdate  | date:"MM/dd/yyyy"}} <b>by</b> {{forum.userId.username}}
						
						<hr/>
						
						
						<div ng-repeat="comment in comments" >
						<div ng-if="(forum.forumId == comment.forumId.forumId)" class="well well-sm">
							
							<span ng-class="{test: comment.forumId.userId.userId==comment.userId.userId}">
							{{comment.forumcomment}} <br/>
						
							[<b>by</b> {{comment.userId.username}} <b>on</b> {{comment.commentDate  | date:"MM/dd/yyyy 'at' h:mma"}}]
							</span>
						</div>
						</div>
						
					</div>
					
					
					
				<security:authorize access="hasRole('ROLE_USER')">
					
					<div class="panel-footer">
					
						<form ng-submit="postComment(post);">
						<div class="input-group">
							<input type="text"  name="comment" id="comment" class="form-control" ng-model="post.comment">
					
							<span class="input-group-btn">
							 	
							 	<input type="submit" ng-click="setForumId(forum.forumId)" class="btn btn-danger" value="Comment">
							</span>
							</div>
							
							</form>
						</div>
										
				</security:authorize>
			
			</div>
		</div>
		


	</div>
<%@ include file="../templates/footer.jsp"%>

</body>
</html>
