golfApp.service("Friendship", ['$log', '$http', function($log, $http){
  return {
    create: function(user, friend, callback){
      $http.post('/api/friendships?user_id='+user.id+'&&friend_id='+friend.id).then(function(response){
        callback(response.data.status)
      })
    },
    getAll: function(url, callback){
      $http.get('/api/'+ url).then(function(response){
        callback(response.data)
      })
    }
  }
}])