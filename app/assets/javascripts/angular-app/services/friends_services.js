golfApp.service("Friendship", ['$log', '$http', function($log, $http){
  return {
    create: function(user, friend, callback){
      $http.post('/api/friendships?user_id='+user.id+'&&friend_id='+friend.id).then(function(data){
        callback(data)
      })
    },
    getAll: function(callback){
      $http.get('/api/'+window.location.pathname+'/friends').then(function(response){
        callback(response.data)
      })
    }
  }
}])