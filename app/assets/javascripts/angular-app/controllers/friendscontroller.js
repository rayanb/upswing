golfApp.controller('FriendsCtrl', [
  '$scope', 'Friendship', 'Users',
  function($scope, Friendship, Users){

    Users.getCurrent(function(data){
      console.log("current user")
      $scope.currentUser = data;
      console.log($scope.currentUser)
    })

    Friendship.getAll(function(data){
      console.log(data)
      $scope.friends = data.friends;
      console.log($scope.friends)
    })

}])