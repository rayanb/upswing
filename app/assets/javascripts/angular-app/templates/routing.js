app.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/users', {
        templateUrl: 'users/index.html.erb',
        controller: 'PhoneListCtrl'
      }).
      when('/user/:userId', {
        templateUrl: 'users/show.html',
        controller: 'PhoneDetailCtrl'
      }).
      otherwise({
        redirectTo: '/'
      });
  }]);