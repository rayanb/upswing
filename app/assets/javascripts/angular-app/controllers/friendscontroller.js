golfApp.controller('FriendsCtrl', [
  '$scope', 'Friendship', 'Users',
  function($scope, Friendship, Users){

    Users.getCurrent(function(data){
      $scope.currentUser = data.user;
    })

    Friendship.getAll(function(data){
      console.log(data)
      $scope.friends = data.friends;
      console.log($scope.friends)
    })

}])