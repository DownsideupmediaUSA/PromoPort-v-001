$(function(){
  $("#new_comment").on("submit", function(e){



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
    e.preventDefault();
  })
});
