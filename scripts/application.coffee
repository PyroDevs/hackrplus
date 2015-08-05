routes = ($routeProvider) ->
  $routeProvider
    .when '/', {
      redirectTo: '/auth'
    }
    .when '/auth', {
      templateUrl: 'templates/routes/auth.html'
      controller: 'AuthenticationController'
    }
    .when '/topic', {
      templateUrl: 'templates/routes/topics.html'
      controller: 'TopicsController'
    }
    .when '/topic/:id/create', {
      templateUrl: 'templates/routes/createPost.html'
      controller: 'CreatePostController'
    }
    .when '/topic/create', {
      templateUrl: 'templates/routes/createTopic.html'
      controller: 'CreateTopicController'
    }
    .when '/topic/:topicId/post/:id', {
      templateUrl: 'templates/routes/post.html'
      controller: 'PostController'
    }
    .when '/topic/:topicId/post/:id/comment', {
      templateUrl: 'templates/routes/createComment.html'
      controller: 'CreateCommentController'
    }
    .when '/topic/:topicId/post/:id', {
      templateUrl: 'templates/routes/post.html'
      controller: 'ViewPostController'
    }
    .when '/topic/:id', {
      templateUrl: 'templates/routes/topic.html'
      controller: 'TopicController'
    }
    .when '/posts', {
      templateUrl: 'templates/routes/viewAllPosts.html'
      controller: 'ViewAllPostsController'
    }
    .otherwise {
      redirectTo: '/auth'
    }
    
routes.$inject = ['$routeProvider']

angular.module 'hackrplus', ['ngRoute', 'firebase']

.config routes

Firebase.enableLogging = (logMessage) ->
  console.log new Date().toISOString() + ': ' + logMessage;