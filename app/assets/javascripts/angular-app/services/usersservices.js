golfApp.service('Users', ['$log', '$http', function($log, $http){
  return {
    getAll: function(preferences, callback){
      $http.get('/api/users?preferences='+ preferences).then(function(response){
        console.log(response.data)
        callback(response.data)
      })
    },
    createConnection: function(user_id, friend_id){
      $http.post('/api/users', params).then(function(){
        console.log("worked")
      })
    }
  }
}])

