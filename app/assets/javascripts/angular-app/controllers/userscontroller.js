golfApp.controller("usersController", [
  '$scope', 'Users', 'Industries', 'Friendship',
  function($scope, Users, Industries, Friendship){

    $scope.users =[];

    $scope.doneSearch = false;

    $scope.noUsers = false;

    $scope.range = 5;

    var getUsers = function(prefs, range){
      choices = JSON.stringify(prefs)
      Users.getAll(choices, range, function(data){
        $scope.users = data.users;
        $scope.currentUser = data.currentUser;
        $scope.doneSearch = true;

        if($scope.users[0].length == 0){
          $scope.noUsers=true;
        }
        else{
          $('.user').css('display', 'block')
        }

      });
    }


    $scope.createParameters = function(prefs, range){
      var selectedPrefs = [];
      $('input[name="preference"]:checked').map(function(){
        selectedPrefs.push(parseInt(this.value));
        this.checked = false;
      });
      range = $('.range').val()
      getUsers(selectedPrefs, range)
      return false;
    }

    $scope.createConnection = function(user){
      $('.user'+user.id).fadeOut()
      .animate({opacity: 0.2}, 1500);
      Friendship.create($scope.currentUser, user,
        function(type){
          if(type.data=="friendship"){
            alert('You got a match with '+ user.name+', you can send an-email to connect at '+ user.email);
          };
      })
      console.log($scope.users)
      $scope.users.splice(0,1)
    }

    $scope.createDisconnection = function(user){
      $('.user'+user.id).fadeOut()
      .animate({opacity: 0.2, left:"-=2000"}, 1500);
      $scope.users.splice(0,1)
    }

    Users.getCurrent(function(data){
      Users.getLocation(data, LOCATION);
    })

    Industries.getAll(function(data){
      $scope.industries = data.industries;
    });


  }
])