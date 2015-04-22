golfApp.service('Users', ['$log', '$http', function($log, $http){
  return {
    getAll: function(industryIds, callback){
      $http.get('/api/users?industryIds='+ industryIds).then(function(response){
        callback(response.data)
      })
    },
    createConnection: function(user_id, friend_id){
      $http.post('/api/users', params).then(function(){
        console.log("worked")
      }).fail(function(){console.log("didnt work")})
    }
  }
}])

