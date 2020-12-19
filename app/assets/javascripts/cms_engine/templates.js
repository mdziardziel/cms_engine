// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(window).on('load', function() {
  $("#add-element").click(function() {
    const lastElement = $("#elements-card").find('.input-group:last');
    const newElement = lastElement.clone();
    newElement.find('input').val("");
    newElement.find('select').val("");
    lastElement.after(newElement);
  });
});

