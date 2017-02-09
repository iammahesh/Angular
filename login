
<html ng-app="app">
	<head>
		<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js">
		</script>
		<script>
			var app=angular.module("app",[]);
			app.controller("MainCtrl",function($scope,$http) {
			$scope.checkLogin = function(result) {
				$http.get("get_oracle_data.jsp?sqlStr=select user_name,passwd from user_master where user_name = '" + $scope.user_name + "'")
				.success(function(response) {
					$scope.myData = response;
					if(angular.isUndefined($scope.myData[0].USER_NAME))
						alert("Invalid user name");
					else
					{
						if($scope.myData[0].PASSWD!=$scope.password)
							alert("Invalid password");
						else
							alert("Successfully logged in");
					}
				})
				.error(function(){
					alert("Resource not found");					
				});
				};
			});
		</script>
	</head>
	<body ng-controller="MainCtrl">
		<form ng-submit="checkLogin()">
		<table>
			<tr>
			<td>Enter User Name : </td><td><input type="text" value="" name="user_name" id="user_name" ng-model="user_name" required/></td> 
			</tr><tr><td>Enter Password : </td><td><input type="text" value=""  name="password" id="password" ng-model="password" required/></td></tr>
			<tr><td colspan="2"><input type="submit" value="Login"  name="btnLogin" id="btnLogin" ng-model="btnLogin" /></td> 
			</tr>			
		</table>
		</form>
	</body>

	</html>
