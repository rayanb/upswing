app = angular.module('app', [
  'templates'
  ]);

app.config(function($httpProvider) {
  token = $("meta[name=\"csrf-token\"]").attr("content");
  $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = token;
});


app.run(function(){
  console.log ('angular app running');
});
