golfApp.controller("FriendsCtrl", [
  '$scope', 'Users', 'Friendship',
  function($scope, Users, Friendship){

    Users.getCurrent(function(data){
      $scope.currentUser = data;
      Friendship.getAll('/users/'+data.id+'/friends', function(data){
        $scope.friends = data.friends;
      });
    })

}])