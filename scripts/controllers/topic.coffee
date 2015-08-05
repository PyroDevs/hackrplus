TopicController = ($scope, db, dataStore, $routeParams, $location, auth) ->
  $scope.createPost = ->
    $location.path "/topic/#{$routeParams.id}/create"
  authData = dataStore.authData
  $scope.dataStore = dataStore
  $scope.location = $location
  $scope.topicId = $routeParams.id
  posts = db.find "topics/#{$routeParams.id}/posts"
  $scope.posts = posts
  
  id = $routeParams.id
  
TopicController.$inject = ['$scope', 'db', 'dataStore', '$routeParams', '$location', 'auth']
  
angular.module 'hackrplus'
  .controller 'TopicController', TopicController