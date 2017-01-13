$(function(){ //anonymous function
/////////////COMMENTS SECTION//////////
// server side AJAX model (have server sort out data prior to responding )
      $("a.load_comments").on("click", function(e){
       // 2 fire an ajax request to get data
         $.ajax({
           url: this.href,
           dataType: 'script'
  // 3 place data in DOM (to the page)
         })
// 1 need to hijack submit button and prevent default action
         e.preventDefault();
       });

//////// submitting a comment/////////////




  $("#new_comment").on("submit", function(e){
    // 1. we need the URL to submit the POST request too
    // 2. we need the form data.

    // Low level
    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        $("#comment_content").val("");
        var $ol = $("div.comments ol")
        $ol.append(response);
      }
    });

    // Send a POST request to the correct place that form would've gone too anyway
    // along with the actual form data.
    e.preventDefault();
  })




});
