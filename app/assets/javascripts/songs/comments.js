$(function() { //anonymous function
/////////////COMMENTS SECTION//////////

  $("#show_comments").on("click", function(e){
    e.preventDefault();
    let id = $(this).data('id')
     $('#comments_collection').fadeToggle()
      $('#comment_content').focus()
       $.get(`/api/songs/${id}`, function(song) {
         var newSongC = SongC()
         newSongC.create(song)
         $(".comments ol").append(newSongC.formatSongsShow())
       })
     })
     $(".new_comment").on("submit", function(e){
        e.preventDefault();
        $.ajax({
          type: ($("input[name='_method']").val() || this.method),
          url: this.action,
          data: $(this).serialize(),
          success: function(response){
        }
      })
        $.ajaxPrefilter(function( options, originalOptions, jqXHR ) { options.async = true; });
      });
    })


const SongC = function() {
   return {
     create(attributes) {
       for (var key in attributes) {
         this[key] = attributes[key]
       }
     },

     formatSongsShow() {
       var comments = this.comments.map(comments =>
         `<li>${comments.user.username} said: ${comments.content} </li>`
       ).join('')
       var songHtml = `
         <ul>
           ${comments}
           </ul>
         `
         return songHtml
       }
      }
}
