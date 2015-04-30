golfApp.controller('FriendsCtrl', [
  '$scope', 'Friendship', 'Users',
  function($scope, Friendship, Users){

    Users.getCurrent(function(data){
      $scope.currentUser = data;
    })

    Friendship.getAll(function(data){
      $scope.friends = data.friends;
    })

}])