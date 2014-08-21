# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

document.toggle_admin = (obj) ->
  console.log('toggle_admin');
  console.dir(obj);
  $.ajax
    url: '/admin/make_admin'
    data:
      user_id: obj.user_id
      is_admin: obj.is_admin
    success: (data, status, XHR) ->
      console.log('server returned data')
      console.dir(data)

document.toggle_can_review = (obj) ->
  console.log('toggle_can_review');
  console.dir(obj);
  $.ajax
    url: '/admin/user_can_review'
    data:
      user_id: obj.user_id
      can_review: obj.can_review
    success: (data, status, XHR) ->
      console.log('server returned data')
      console.dir(data)
