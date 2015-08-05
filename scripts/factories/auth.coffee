auth = ($firebaseAuth) ->
  ref = new Firebase 'http://hackrplus.firebaseio.com'
  $firebaseAuth(ref)
  
auth.$inject = ['$firebaseAuth']

angular.module 'hackrplus'

.factory 'auth', auth