// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

const removeElement = (self) => {
  if ($('.element-row').length > 1) {
    $(self).closest('.element-row').remove();
  }
}

const addElement = () => {
  const lastElement = $("#elements-card").find('.element-row:last');
  const newElement = lastElement.clone();
  newElement.find('input').val("");
  newElement.find('select').val("");
  lastElement.after(newElement);
}

$(window).on('load', function() {
  $("#add-element").click(function() {
    addElement();

    $(".remove-element").click(function() {
      removeElement(this);
    });
  });

  $(".remove-element").click(function() {
    removeElement(this);
  });
});

