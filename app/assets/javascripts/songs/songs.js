$(function(){ //anonymous function
/////////////COMMENTS SECTION//////////

      $("#show_comments").on("click", function(e){
         e.preventDefault();
        $('#comments_collection').fadeToggle()
         $('#comment_content').focus()

        var url = this.action
        $.ajax({
          method: "GET",
          url: url,
        })
       })

//////// submitting a comment/////////////




  // $("#new_comment").on("submit", function(e){
  //   // 1. we need the URL to submit the POST request too
  //   // 2. we need the form data.
  //
  //   // Low level
  //   $.ajax({
  //     type: ($("input[name='_method']").val() || this.method),
  //     url: this.action,
  //     data: $(this).serialize(),
  //     success: function(response){
  //       $("#comment_content").val("");
  //       var $ol = $("div.comments ol")
  //       $ol.append(response);
  //     }
  //   });
  //
  //   // Send a POST request to the correct place that form would've gone too anyway
  //   // along with the actual form data.
  //   e.preventDefault();
  // })




});
