CreateCommentController = ($scope, db, dataStore, getAuthData, $routeParams, $location) ->
  authData = dataStore.authData
  $scope.authData = getAuthData authData
  $scope.author = $scope.authData.username
  $scope.submit = ->
    db.create {
      comment: $scope.comment
      poster: $scope.author
    }, "topics/#{$routeParams.topicId}/posts/#{$routeParams.id}/comments"
    $location.path '/topic'
  
CreateCommentController.$inject = ['$scope', 'db', 'dataStore', 'getAuthData', '$routeParams', '$location']

angular.module 'hackrplus'

  .controller 'CreateCommentController', CreateCommentController