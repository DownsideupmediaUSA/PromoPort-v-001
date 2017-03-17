$(function() {
 bindClickEvents()
})
   //anonymous function
/////////////COMMENTS SECTION//////////
 function bindClickEvents() {
   $("#all_tracks").on("click", function(e){
     e.preventDefault();
     $('#songs_collection').fadeToggle()
      $.get('/api/songs', function(data) {
        $("#songs_collection").html('')
        data.forEach(function(song){
          var newSong = Song()
          newSong.create(song)
          $("#songs_collection").append(newSong.formatSongsIndex())
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
          const newSong = Song()
          newSong.create(song)
          $('.trackBanner').append(newSong.formatSongShow())
      })
    history.pushState(null, null, `/songs/${id}`)
   })
  }

const Song = function() {
  return {
    create(attributes) {
      for (var key in attributes) {
        this[key] = attributes[key]
      }
    },

    formatSongsIndex() {
      var songHtml = ''
      songHtml += `<a href="/songs/${this.id}" class="song-title" data-id=${this.id}><h4>${this.title}</h4></a> by: `
      songHtml += `<h7>${this.artist.artist_name}</h7> <br>`
      songHtml += `number of comments: ${this.comments.length}`
      return songHtml
    },

    formatSongShow() {
      var comments = this.comments.map(comments =>
        `<li>${comments.user.username} said: ${comments.content} </li>`
      ).join('')
      var songHtml = `
        <h4>${this.title}</h4></a>
        <h6>${this.artist.artist_name}</h6>
        <h6># of comments: ${this.comments.length}</h6>
        <a href="/songs/${this.id}" class="leave-comment"><h6>Leave A Comment</h6></a>
        <img src=${this.image}/>
        <h6>Comments:</h6>
        <ul>
          ${comments}
        </ul>
      `
      return songHtml
    }
   }


  }
