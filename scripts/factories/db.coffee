db = ($firebaseArray, $firebaseObject) ->
  
  url = 'https://hackrplus.firebaseio.com'
  
  buildArray = (resource) ->
    ref = new Firebase "#{url}/#{resource}"
    $firebaseArray ref 
    
  buildObject = (resource) ->
    ref = new Firebase "#{url}/#{resource}"
    $firebaseObject ref
  
  find = (resource) ->
    buildArray resource
    
  findObj = (resource) ->
    buildObject resource
    
  create = (object = {}, resource) ->
    array = buildArray resource
    array.$add object
    
  edit = (object = {}, resource) ->
    array = buildArray resource
    
  del = (key, resource) ->
    array = buildArray resource
    array.$remove key
    
  res =
    create: create
    edit: edit
    del: del
    find: find
    findObj: findObj
    
  
db.$inject = ['$firebaseArray', '$firebaseObject']

angular.module 'hackrplus'

.factory 'db', db