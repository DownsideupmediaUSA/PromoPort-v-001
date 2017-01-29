$(function(){ //anonymous function
/////////////COMMENTS SECTION//////////

      $("#all_tracks").on("click", function(e){
         e.preventDefault();
        $('#songs_collection').fadeToggle()
         $('#song_content').focus()
          $.get('/api/songs', function(data) {
            $("#songs_collection").html('')
             data.forEach(function(song){
               var newSong = new Song(song.id, song.title, song.artist, song.comments)
               var formattedSong = newSong.formatSongsIndex()
                $("#songs_collection").append(formattedSong)
             })
           })
         })



           function Song(id, title, artist, comments) {
             this.id = id
             this.title = title
             this.artist = artist
             this.comments = comments
           }

          Song.prototype.formatSongsIndex = function() {
          var songHtml = ''
          songHtml += `<a href="#" class="song-title" data-id=${this.id}><h4>${this.title}</h4></a> by:`
          songHtml += `<a href="#" class="song-artist-name" data-id=${this.id}><h7>${this.artist.artist_name}</h7> </a><br>`
          songHtml += `number of comments: ${this.comments.length}`
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
