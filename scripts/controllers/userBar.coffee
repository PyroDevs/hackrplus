UserBarController = ($scope, $location, dataStore, auth, getAuthData) ->
  $scope.logout = ->
    auth.$unauth()
    $location.path '/auth' 
    dataStore.authData = {}
  console.log dataStore.authData
  
UserBarController.$inject = ['$scope', '$location', 'dataStore', 'auth', 'getAuthData']

angular.module 'hackrplus'

.controller 'UserBarController', UserBarController