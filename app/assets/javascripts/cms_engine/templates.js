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

  $(".element-type-selector").change(function() {
    const type = $(this).val()
    const typeInputSelector = `#hidden-${type}-input`
    const typeInputContainer = $(typeInputSelector).clone()
    const input = $(this).closest('.element-row').find('.content-input')
    const inputContainer = $(this).closest('.element-row').find('.content-input-container')
    const inputName = input.attr('name')
    const inputId = input.attr('id')
    const typeInput = typeInputContainer.find('.form-control')

    // html editor
    const trixieEditor = typeInputContainer.find('trix-editor')

    if (trixieEditor) {
      trixieEditor.attr('input', inputId)
      typeInput.attr('value', '')
    }

    // html editor

    typeInput.attr('name', inputName)
    typeInput.attr('id', inputId)
    typeInput.removeClass('hidden-form')
    typeInput.addClass('content-input')
    inputContainer.replaceWith(typeInputContainer)
  })
});

