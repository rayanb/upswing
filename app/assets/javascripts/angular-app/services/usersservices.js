golfApp.service('Users', ['$log', '$http', function($log, $http){
  return {
    getAll: function(preferences, callback){
      $http.get('/api/users?preferences='+ preferences).then(function(response){
        console.log(preferences)
        callback(response.data)
      })
    }
  }
}])