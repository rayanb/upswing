golfApp.service('Users', ['$log', '$http', function($log, $http){
  return {
    getAll: function(industryIds, callback){
      $http.get('/api/users?industryIds='+ industryIds).then(function(response){
        callback(response.data)
      })
    }
  }
}])

