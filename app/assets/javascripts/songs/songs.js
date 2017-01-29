$(function(){ //anonymous function
/////////////COMMENTS SECTION//////////

      $("#all_tracks").on("click", function(e){
         e.preventDefault();
        $('#songs_collection').fadeToggle()
         $('#song_content').focus()
          $.get('/api/songs', function(data) {
            $("#songs_collection").html('')
             data.forEach(function(song){
               var newSong = new Song(song.id, song.title, song.artist)
               var formattedSong = newSong.formatSong()
                console.log(formattedSong)
                $("#songs_collection").append(formattedSong)
             })
           })
         })



           function Song(id, title, artist) {
             this.id = id
             this.title = title
             this.artist = artist
           }

          Song.prototype.formatSong = function() {
          var songHtml = ''
          songHtml += '<h4>' + this.title + '</h4>'+ "by:"
          songHtml += '<h7>' + this.artist.artist_name  + '</h7>'

          return songHtml

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
