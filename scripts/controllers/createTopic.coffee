CreateTopicController = ($scope, dataStore, getAuthData, auth, db, $location) ->
  $scope.submit = ->
    db.create {
      name: $scope.name
      description: $scope.description
      posts: []
      poster: $scope.author
    }, 'topics'
    $location.path '/topic'
  $scope.auth = auth
  authData = dataStore.authData
  $scope.authData = getAuthData authData
  $scope.author = $scope.authData.username
  
CreateTopicController.$inject = ['$scope', 'dataStore', 'getAuthData', 'auth', 'db', '$location']  
  
angular.module 'hackrplus'
  
  .controller 'CreateTopicController', CreateTopicController