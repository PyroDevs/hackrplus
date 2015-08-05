ViewAllPostsController = ($scope, db) ->
  $scope.posts = db.find 'posts'
  
ViewAllPostsController.$inject = ['$scope', 'db']

angular.module 'hackrplus'

  .controller 'ViewAllPostsController', ViewAllPostsController