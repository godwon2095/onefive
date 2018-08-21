# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  if $('.pagination').length && $('#posts').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("")
        $.getScript(url)
    $(window).scroll

$ ->
  new AvatarCrop()

class AvatarCrop
  constructor: ->
    width = parseInt($('#cropbox').width())
    height = parseInt($('#cropbox').height())
    $('#cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, width, height]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#post_crop_x').val(coords.x)
    $('#post_crop_y').val(coords.y)
    $('#post_crop_w').val(coords.w)
    $('#post_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    rx = 100 / coords.w
    ry = 100 / coords.h

    $('#preview').css
        width: Math.round(rx * $('#cropbox').width()) + 'px'
        height: Math.round(ry * $('#cropbox').height()) + 'px'
        marginLeft: '-' + Math.round(rx * coords.x) + 'px'
        marginTop: '-' + Math.round(ry * coords.y) + 'px'
