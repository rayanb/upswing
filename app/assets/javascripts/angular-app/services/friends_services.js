golfApp.service("Friendship", ['$log', '$http', function($log, $http){
  return {
    createRequest: function(user, friend){
      console.log(user)
      console.log(friend)
      $http.post('/api/friendrequests?user_id='+user.user.id+'&&friend_id='+friend.id)
      .then(function(data){
        console.log(data);
      })
    },
    create: function(user, friend){
      $http.post('/api/friendships?user_id='+user.user.id+'&&friend_id='+friend.id).then(function(data){console.log(data)})
    }
  }
}])