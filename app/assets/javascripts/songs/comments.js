$(function(){ //anonymous function
/////////////COMMENTS SECTION//////////

      $("#show_comments").on("click", function(e){

         e.preventDefault();
        $('#comments_collection').fadeToggle()
         $('#comment_content').focus()
          $.get('/api/songs', function(data) {
             data.forEach(function(song){
               var newSong = new Song(song.id, song.comments)
               var formattedSong = newSong.formatSong()
              $("div.comments ol").append(formattedSong);
               $("#comment_content").val("");
               var $ol = $("div.comments ol")

              })
           })
         })


           function Song(id, comments) {
             this.id = id
             this.comments = comments
           }

           
          Song.prototype.appendToElement = function(element) {
          // var songHtml = ''
          // songHtml += '<h5>' + this.user.username + 'said:' + '</h5>'
          // songHtml += '<h5>' + this.comments.content +  '</h5>'
          // return songHtml



          var songString = `
            <ul>
              <li>
                 <em> ${this.user.username} said:</em>
                 ${this.content}
              </li>
            </ul>
          `

          element.append(songString);
        }



//////// submitting a comment/////////////
//
// $(function(){
//   $("#input").on("submit", function(e){
//    $.ajax({
//      type: ($("input[name='_method']").val() || this.method),
//      url: this.action,
//      data: $(this).serialize(),
//      success: function(response){
//        $("#comment_content").val("");
//        var $ol = $("div.comments ol")
//        $ol.append(response);
//        console.log(response)
//      }
//    });
//     e.preventDefault();
//   })
// });




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
