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
                // alert("this is huh")
                // $("#comment_content").val("");
                // var $ol = $(".comments ol")
                // $ol.append(response);

              //  debugger
              //  $.get(`/api/comments`, function(comment) {


                //  var newComment = new Comment(comment.id, comment.user, comment.content)
                //  var formattedComment = newComment.formatComments()
                 //
                //  $(".comments ol").append(formattedComment)


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






//            function Song(id, comments) {
//              this.id = id
//              this.comments = comments
//            }
//
//
//           Song.prototype.formatSongComments = function() {
//
//
            // var comments = this.comments.map(comments => `<li>${comments.user.username} said: ${comments.content} </li>`).join('')
            // var songHtml = ''
            // songHtml += '<h5>' + this.comments.user + 'said:' + '</h5>'
            // songHtml += '<h5>' + this.comments.content +  '</h5>'
            // return songHtml
//
//
//
          // var songHtml = `
          //   <ul>
          //     <li>
          //        ${comments}
          //     </li>
          //   </ul>
          //  `
          // //
          // return songHtml;
//         }
//
//
//
// //////// submitting a comment/////////////
// //
// // $(function(){
//   // $("#input").on("submit", function(e){
// //    $.ajax({
// //      type: ($("input[name='_method']").val() || this.method),
// //      url: this.action,
// //      data: $(this).serialize(),
// //      success: function(response){
// //        $("#comment_content").val("");
// //        var $ol = $("div.comments ol")
// //        $ol.append(response);
// //        console.log(response)
// //      }
// //    });
// //     e.preventDefault();
// //   })
// // });
//
//
//
//
  // $(".new_comment").on("click", function(e){
  //    e.preventDefault();
  //   alert("jacked")
  //
  //    $.ajax({
  //      type: ($("input[name='_method']").val() || this.method),
  //      url: this.action,
  //      data: $(this),
  //      success: function(response){
  //        $("#comment_content").val("");
  //        var $ol = $("div.comments ol")
  //        $ol.append(response);
  //       // debugger
  //       // $.get(`/api/comments`, function(comment) {
  //       //
  //       //
  //       //   var newComment = new Comment(comment.id, comment.user, comment.content)
  //       //   var formattedComment = newComment.formatComments()
  //       //
  //       //   $(".comments ol").append(formattedComment)
  //       //
  //        console.log(response)
  //      }
  //    })
  //  });
//
//
//    function Comment(id, user, content) {
//      this.id = id
//      this.user = user
//      this.content = content
//    }
//
//    Song.prototype.formatComments = function() {
//
//
//      var comments = this.comments.map(comments => `<li>${comments.user.username} said: ${comments.content} </li>`).join('')
//      var commentHtml = `
//      <ul>
//        <li>
//           ${comments}
//        </li>
//      </ul>
//     `
//    //
//    return commentHtml;
//  }






}
