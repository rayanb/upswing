golfApp.controller("usersController", [
  '$scope', 'Users', 'Industries', 'Friendship',
  function($scope, Users, Industries, Friendship){

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

    $scope.createPreferences = function(data){
      var selectedPrefs = [];
      $('input[name="preference"]:checked').map(function(){
        selectedPrefs.push(parseInt(this.value));
        this.checked = false;
      });
      getUsers(selectedPrefs)
      return false;
    }

    $scope.createConnection = function(user){
        console.log(user)
        console.log($scope.currentUser)
      if(user.user.has_liked_current_user == true){
        Friendship.create(user, $scope.currentUser)
      }
      else{
        Friendship.createRequest(user, $scope.currentUser)
      }
      $scope.users.splice(0, 1);
      console.log($scope.users);
    }

    $scope.createDisconnection = function(user){
      $scope.users.splice(0, 1);
      console.log("delete user through service");

    }
  }
])