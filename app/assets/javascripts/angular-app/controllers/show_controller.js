golfApp.controller('ShowCtrl', [
  '$scope', 'Users',
  function($scope, Users){

    Users.getCurrent(function(data){
      $scope.currentUser = data;
    })

}])