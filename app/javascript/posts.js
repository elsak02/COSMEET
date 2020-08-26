$(document).ready(function() {
  imageHandler()
})

function imageHandler() {
  $('#user_photo').on('keyup', function(event) {
    if (event.keyCode == 86) {
      cleareMediaPreview();
      const imageUrl = $('#user_photo').val()
      showImagePreview(imageUrl)
    }
    if (event.keyCode == 8) {
      if ($('#user_photo').val() == "") {
        // user cleared an image url, generate image preview
        clearMediaPreview();
      }
    }
  })
}

function clearMediaPreview() {
 $('.media-preview').html('')
}

function showImagePreview(imageUrl) {
 $('.media-preview').html('<img src=' + imageUrl + '>')
}

function showImageUrl() {
  $('#user_photo').show()
}

function hideImageUrl() {
  $('#user_photo').hide()
}
