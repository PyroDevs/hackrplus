userBar = ->
  options =
    templateUrl: 'templates/directives/user-bar.html'
    restrict: 'E'
    controller: 'UserBarController'
  options
  
angular.module 'hackrplus'
  .directive 'userBar', userBar