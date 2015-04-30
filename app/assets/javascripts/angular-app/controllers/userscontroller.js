golfApp.controller("usersController", [
  '$scope', 'Users', 'Industries', 'Friendship',
  function($scope, Users, Industries, Friendship){

    $scope.users =[];

    $scope.doneSearch = false;

    $scope.noUsers = false;

    var getUsers = function(prefs){
      choices = JSON.stringify(prefs)
      Users.getAll(choices, function(data){
        $scope.users = data.users;
        $scope.currentUser = data.currentUser;
        $scope.doneSearch = true;
        if($scope.users.length == 0){
          $scope.noUsers=true;
        }
        $('.user').css('display', 'block')
        console.log($scope.users)
        console.log($scope.currentUser)
      });
    }


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
      Friendship.create($scope.currentUser, user ,
        function(type){
          if(type.data=="friendship"){
            $('body').append('<h1>'+user.name+' got a match</h1>')
          }
        })
      $scope.users.splice(0, 1);
      console.log($scope.users);
    }

    $scope.createDisconnection = function(user){
      $scope.users.splice(0, 1);
      console.log("delete user through service");
    }

    $(document).ready(function(){
        Users.getCurrent(function(data){
          Users.getLocation(data, LOCATION);
        })

        Industries.getAll(function(data){
          $scope.industries = data.industries;
          console.log(data.industries)
        });
    })


  }
])