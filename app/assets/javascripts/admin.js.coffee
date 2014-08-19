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
      console.dir(data)
