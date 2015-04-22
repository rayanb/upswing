golfApp.service('Industries', ['$log', '$http', function($log, $http){
  return {
    getAll: function(callback){
      $http.get('/api/industries').then(function(response){
        callback(response.data)
      })
    }
  }
}])

