golfApp.controller("usersController", [
  '$scope', 'Users', 'Industries',
  function($scope, Users, Industries){

    $scope.users =[];


    var getUsers = function(prefs){
      choices = JSON.stringify(prefs)
      Users.getAll(choices, function(data){
        $scope.users = data.users;
        $scope.currentUser = data.currentUser;
      });
    }

    Industries.getAll(function(data){
      $scope.industries = data.industries;
      console.log(data.industries)
    });

    $scope.createConnection = function(currentUser, friendId){
      Users.createUser({name: 'Rayan', email: $('.name').val()})
      getUsers();
      return false;
    };

    $scope.createPreferences = function(data){
      var selectedPrefs = [];
      $('input[name="preference"]:checked').map(function(){
        selectedPrefs.push(parseInt(this.value));
        this.checked = false;
      });
      getUsers(selectedPrefs)
      return false;
    }

    $scope.pickUser = function(user){
      $scope.users.splice(0, 1)
      console.log($scope.users)
    }
  }
])