$(document).ready(function () {
  $.get('/country').done(function (name) {
    $('#country').text(name);
    console.log(name;);
  });
});
