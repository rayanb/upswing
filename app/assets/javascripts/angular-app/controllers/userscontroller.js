angular.module('app.golfApp', []).controller("usersController", [
  '$scope',
  function($scope){
    console.log('ExampleCtrl running');
    $scope.user = {name: "Rayan", profession: "Web Dev"}
  }
])