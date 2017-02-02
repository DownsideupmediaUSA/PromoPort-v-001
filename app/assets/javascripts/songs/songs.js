$(function() {
 bindClick()
})
   //anonymous function
/////////////COMMENTS SECTION//////////
     function bindClick() {
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

         $(document).on('click', '.song-title', function(e) {
           e.preventDefault()
           const id = $(this).data('id')
           debugger
           fetch(`/api/songs/${id}`)
             .then(response => response.json())
             .then(song => {
             $('#trackBanner').html('')
             const newSong = new Song(song.id, song.title, song.artist, song.comments)
             const formattedSong = newSong.formatSongShow()
             $('#trackBanner').append(formattedSong)
            })
          history.pushState(null, null, `/songs/${id}`)
         })
        }


           function Song(id, title, artist, comments) {
             this.id = id
             this.title = title
             this.artist = artist
             this.comments = comments
           }

          Song.prototype.formatSongsIndex = function() {
            var songHtml = ''
            songHtml += `<a href="#" class="song-title" data-id=${this.id}><h4>${this.title}</h4></a> by: `
            songHtml += `<a href="#" class="song-artist-name" data-id=${this.id}><h7>${this.artist.artist_name}</h7> </a><br>`
            songHtml += `number of comments: ${this.comments.length}`
            return songHtml
          }

          Song.prototype.formatSongShow = function() {
            var songHtml = `
                            <h4>${this.title}</h4>
                            <h6>${this.artist.artist_name}</h6>
                           `
            console.log(songHtml)
            return songHtml


          }
// });
