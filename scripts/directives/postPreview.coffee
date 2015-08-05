settings = ->
  {
    templateUrl: 'templates/directives/post-preview.html',
    scope: {
      post: '='
      topic: '='
    }
  }

angular.module 'hackrplus'

  .directive 'postPreview', settings