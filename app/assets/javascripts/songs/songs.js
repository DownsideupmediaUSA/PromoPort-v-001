$(function() {
 bindClick()
})
   //anonymous function
/////////////COMMENTS SECTION//////////
     function bindClick() {
      $("#all_tracks").on("click", function(e){
         e.preventDefault();
        $('#songs_collection').fadeToggle()

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
            fetch(`/api/songs/${id}`)
              .then(response => response.json())
              .then(song => {
                $('.trackBanner').html('')
                console.log(song)
                const newSong = new Song(song.id, song.title, song.artist, song.comments, song.image, song.user)
                const formattedSong = newSong.formatSongShow()
                $('.trackBanner').append(formattedSong)
            })
          history.pushState(null, null, `/songs/${id}`)
         })
        }


           function Song(id, title, artist, comments, image) {
             this.id = id
             this.image = image
             this.title = title
             this.artist = artist
             this.comments = comments
           }

          Song.prototype.formatSongsIndex = function() {
            var songHtml = ''
            songHtml += `<a href="/songs/${this.id}" class="song-title" data-id=${this.id}><h4>${this.title}</h4></a> by: `
            songHtml += `<h7>${this.artist.artist_name}</h7> <br>`
            songHtml += `number of comments: ${this.comments.length}`
            return songHtml
          }

          Song.prototype.formatSongShow = function() {
            console.log(this)
            var comments = this.comments.map(comments => `<li>${comments.user.username} said: ${comments.content} </li>`).join('')

            var songHtml = `
                            <h4>${this.title}</h4></a>
                            <h6>${this.artist.artist_name}</h6>
                            <h6># of comments: ${this.comments.length}</h6>
                            <a href="/songs/${this.id}" class="leave-comment"><h6>Leave A Comment</h6>
                            <img src=${this.image}/>

                            <h6>Comments:</h6>
                            <ul>
                            ${comments}
                            </ul>
                            <ba
                           `

            return songHtml
          }
