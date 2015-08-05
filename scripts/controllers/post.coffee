ViewPostController = ($scope, $routeParams, db, $location) ->
  $scope.createComment = ->
    $location.path "/topic/#{$routeParams.topicId}/post/#{$routeParams.id}/comment"
  baseurl = "topics/#{$routeParams.topicId}/posts/#{$routeParams.id}"
  comments = db.find "#{baseurl}/comments"
  $scope.post = db.findObj baseurl
  $scope.comments = db.find "#{baseurl}/comments"
  
ViewPostController.$inject = ['$scope', '$routeParams', 'db', '$location']
  
angular.module 'hackrplus'

  .controller 'ViewPostController', ViewPostController