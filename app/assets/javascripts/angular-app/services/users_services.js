golfApp.service('Users', ['$log', '$http', function($log, $http){
  return {
    getAll: function(industryIds, range, callback){
      $http.get('/api/users?industryIds='+ industryIds+'&&range='+range).then(function(response){
        callback(response.data)
      })
    },
    getCurrent: function(callback){
      $http.get('/api/current_user').then(function(response){
        callback(response.data)
      })
    },
    getLocation: function(user, location){
      $http.get('/api/users/'+user.id+'/location?ip_address='+location).then(function(response){
        console.log("Got users")
      })
    },
    edit: function(current_user_id, form, callback){
      $http.put('/api/users/'+current_user_id+'?='+ form)
      .then(function(response){
        if(response.data.message == "fail"){
          alert('Editing failed')
        }else{
          callback(response.data)
        }
      })
    }
  }
}])

