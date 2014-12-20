$(document).ready(function () {
  var num_of_questions = 0
  var num_of_choices = []
  $("#question").on("submit", function(event) {
    event.preventDefault();

    var url = $(this).attr('action')
    var data = $(this).serialize();

    $.ajax({
      type: "POST",
      url: url ,
      data: data
    }).done(function(response) {
      $("#questions-container").append("<li>"+response.content+"</li>")
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
        $(response).on("submit" )

     })
  })

  $("#add_question").on("click", function(event) {
    event.preventDefault();
    num_of_questions++
    var url = $(this).attr('href')

     $.ajax({
       type: "GET",
       url: url + "?num=" + num_of_questions
     }).done(function(response) {
        $("#questions-container").append(num_of_questions + ". " + response)
        $("#question" + num_of_questions).on("click", create_choice)
   })
   })

 var create_choice = function () {
    event.preventDefault();
     var url = $(this).attr('href')
     var question_num = $(this).attr('id').replace("question","")
     console.log(question_num)
     var num_of_choices = $("#choice-container"+ question_num + " > input").length
     num_of_choices++
     console.log(num_of_choices)
     $.ajax({
       type: "GET",
       url: url + "?q=" + question_num + "&c=" + num_of_choices
     }).done(function(response) {
        console.log(response)
        $("#choice-container" + question_num).append("choice #" + num_of_choices + ": " + response + "<br>")
     })
  }


  $("create_survey_form").on("submit", function(event){
    debugger
    event.preventDefault();
    var url = $(this).attr('action');
    var data = $(this).serialize();

    $.ajax({
      type: "POST",
      url: url,
      data : data
    }).done(function(response) {
      debugger;
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
