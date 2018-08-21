$(document).ready(function(){
$('.sidenav').sidenav({
  edge: 'right'
});
});
$('.dropdown-trigger').dropdown();
$(document).ready(function(){
$('.modal').modal();
});
$(document).ready(function(){
$('.tabs').tabs();
});

$('#search-music').on('click', function () {
$(this).attr('style', 'color: #0b1d7b !important');
$('#search-user').attr('style', 'color: #7a7a7a !important');
$('#search-post').attr('style', 'color: #7a7a7a !important');
});
$('#search-user').on('click', function () {
$(this).attr('style', 'color: #0b1d7b !important');
$('#search-music').attr('style', 'color: #7a7a7a !important');
$('#search-post').attr('style', 'color: #7a7a7a !important');
});
$('#search-post').on('click', function () {
$(this).attr('style', 'color: #0b1d7b !important');
$('#search-music').attr('style', 'color: #7a7a7a !important');
$('#search-user').attr('style', 'color: #7a7a7a !important');
});
