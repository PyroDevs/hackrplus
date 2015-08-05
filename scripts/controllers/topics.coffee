TopicsController = ($scope, db, dataStore, auth, $location, getAuthData) ->
  $scope.dataStore = dataStore
  $scope.createTopic = ->
    $location.path '/topic/create'
  posts = db.find 'posts'
  $scope.topics = db.find 'topics'
      
TopicsController.$inject = ['$scope', 'db', 'dataStore', 'auth', '$location', 'getAuthData']
  
angular.module 'hackrplus'
  .controller 'TopicsController', TopicsController