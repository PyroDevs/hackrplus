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
  
  TopicsController = ($scope, db, dataStore, auth, $location, getAuthData) ->
  $scope.dataStore = dataStore
  $scope.createTopic = ->
    $location.path '/topic/create'
  posts = db.find 'posts'
  $scope.topics = db.find 'topics'
      
TopicsController.$inject = ['$scope', 'db', 'dataStore', 'auth', '$location', 'getAuthData']
  
angular.module 'hackrplus'
  .controller 'TopicsController', TopicsController
  
  UserBarController = ($scope, $location, dataStore, auth, getAuthData) ->
  $scope.logout = ->
    auth.$unauth()
    $location.path '/auth' 
    dataStore.authData = {}
  console.log dataStore.authData
  
UserBarController.$inject = ['$scope', '$location', 'dataStore', 'auth', 'getAuthData']

angular.module 'hackrplus'

.controller 'UserBarController', UserBarController

ViewAllPostsController = ($scope, db) ->
  $scope.posts = db.find 'posts'
  
ViewAllPostsController.$inject = ['$scope', 'db']

angular.module 'hackrplus'

  .controller 'ViewAllPostsController', ViewAllPostsController