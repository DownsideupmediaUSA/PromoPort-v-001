$(function(){ //anonymous function
/////////////COMMENTS SECTION//////////

      $("#show_comments").on("click", function(e){
         e.preventDefault();
        $('#comments_collection').fadeToggle()
         $('#comment_content').focus()
          $.get('/api/songs', function(data) {
             data.forEach(function(song){
               var newSong = new Song(song.id, song.comments)

              })
           })
         })


           function Song(id, comments) {
             this.id = id
             this.comments = comments
             console.log(id, comments)
           }
        // function comment(id, contents) {
        //   this.id = id
        //   this.content = content
        // }
        //
          Song.prototype.appendToElement = function(element) {
          // var commentHtml = ''
          // commentHtml += '<h5>' + this.comment + '</h5>'
          // return commentHtml
          var songString = `

              <ul>
            <li>
               <em> ${this.user.username} said:</em>
               ${this.content}
            </li>
            </ul>
          `;
          element.append(songString);
        }



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
