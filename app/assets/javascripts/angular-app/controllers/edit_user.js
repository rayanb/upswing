golfApp.controller('editUser', ['$scope', 'Users', function($scope, Users){

  Users.getCurrent(function(data){
    $scope.currentUser = data;
  })

  $scope.editInfo = function(){
    console.log("hey")
    var form = $('.edit_form').serialize();
    Users.edit($scope.currentUser.id, form, function(data){
      window.location.replace(data)
    })

  }

}])