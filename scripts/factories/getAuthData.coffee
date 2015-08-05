getAuthData = ($location) ->
  (authData) ->
    if authData
      authData[authData.provider]
    
getAuthData.$inject = ['$location']

angular.module 'hackrplus'

  .factory 'getAuthData', getAuthData