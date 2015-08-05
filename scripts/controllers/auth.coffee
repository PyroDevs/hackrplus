AuthenticationController = (auth, $scope, dataStore, $location) ->
  onAuth = (authData) ->
    if authData
      dataStore.authData = authData
      console.log dataStore.authData
      $location.path '/topic' 
  auth.$onAuth onAuth
  error = (err) -> console.error error
  $scope.authWith = (provider) ->
    auth.$authWithOAuthPopup provider
    .catch error
  
AuthenticationController.$inject = ['auth', '$scope', 'dataStore', '$location']

angular.module 'hackrplus'

.controller 'AuthenticationController', AuthenticationController