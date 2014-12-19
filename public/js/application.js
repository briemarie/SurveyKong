
$(document).ready(function () {

  $("#question").on("click", function(event) {
    event.preventDefault();

    var url = $(this).attr('action')
    var data = $(this).serialize();

    $.ajax({
      type: "POST",
      url: url ,
      data: data
    }).done(function(response) {
      $("#choice-container").append(response)
    })
  })

  $("#create_survey").on("click", function(event) {
    event.preventDefault();

    var url =$(this).attr('href')

     $.ajax({
       type: "GET",
       url: url
     }).done(function(response) {
       console.log(response)
        $("#survey_container").append(response)
     })
  })

  $("#add_question").on("click", function(event) {
    event.preventDefault();

     var url = $(this).attr('href')

     $.ajax({
       type: "GET",
       url: url
     }).done(function(response) {
        $("#questions-container").append(response)
     })
  })



  $("#create_survey_form").on("submit", function(event){
    event.preventDefault();
    var url = $(this).attr('action');
    var data = $(this).serialize();

    $.ajax({
      type: "POST",
      url: url,
      data : data
    }).done(function(response) {
      $('#surveys_created').append("<li>"+response.survey+"</li>");
    })

  })
  // send an HTTP DELETE request for the sign-out link
  // $('a#sign-out').on("click", function (e) {
  //   e.preventDefault();
  //   var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
  //   request.done(function () { window.location = "/"; });
  // });
});
