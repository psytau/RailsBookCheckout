# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
toggle_can_do_it = () ->
  checkboxData = $(this).data()
  checkboxData.can_do_it = this.checked
  originalVal = !this.checked
  checkbox = $(this)
  checkbox.prop('disabled', true)
  $.ajax
    url: '/admin/can_do'
    data: checkboxData
    success: (data, status, XHR) ->
      # double check from server that we can change the value
      $(checkbox).prop('checked', data.can_do_it)
      $(checkbox).prop('disabled', false)
    error: () ->
      $(checkbox).prop('checked', originalVal)
      $(checkbox).prop('disabled', false)

$( () ->
  $('.can-do-it').change(toggle_can_do_it)
)
