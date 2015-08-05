CreatePostController = ($scope, db, dataStore, $location, getAuthData, $routeParams) ->
  authData = dataStore.authData
  $scope.authData = getAuthData authData
  $scope.author = $scope.authData.username
  $scope.submitPost = ->
    settings = 
      title: $scope.title
      body: $scope.body
      poster: $scope.author
      comments: []
    db.create settings, "topics/#{$routeParams.id}/posts"
    db.create settings, 'posts'
    $location.path '/topic'
  
CreatePostController.$inject = ['$scope', 'db', 'dataStore', '$location', 'getAuthData', '$routeParams']

angular.module 'hackrplus'

.controller 'CreatePostController', CreatePostController