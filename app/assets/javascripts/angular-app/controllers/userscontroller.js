golfApp.controller("usersController", [
  '$scope', 'Users',
  function($scope, Users){
    var prefs = JSON.stringify(['businessman', 'golfer'])
    // add an event listener that triggers this function after preferences set up
    var getUsers = function(){
      Users.getAll(prefs, function(data){
        $scope.users = data.users;
        console.log(data)
        $scope.currentUser = data.currentUser;
      });
    }

    getUsers();

    $scope.createConnection = function(currentUser, friendId){
      Users.createUser({name: 'Rayan', email: $('.name').val()})
      getUsers()
      return false;
    };

  }
])