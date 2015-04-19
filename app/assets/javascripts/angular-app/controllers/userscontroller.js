golfApp.controller("usersController", [
  '$scope', 'Users',
  function($scope, Users){
    var prefs = JSON.stringify(['businessman', 'golfer'])
    // add an event listener that triggers this function after preferences set up
    Users.getAll(prefs, function(data){
      $scope.users = data;
    })
  }
])