<!-- Luke's code for getting comments-->
<script type="text/javascript">
  $( document ).ready(function() {
    $('#show_comments').on('click', () => {
      var commentsElement = $('#comments_collection')
      if (commentsElement.css('display') === 'none') {
        fetch("/songs/" + <%= @song.id %> + "/comments.json", {
          method: 'GET',
          credentials: 'include'
        })
          .then((response) => {
            return response.json();
          })
          .then((comments) => {
            comments.forEach((commentData) => {
              var comment = new Comment(commentData);
              comment.appendToElement(commentsElement);
            })
          })
        commentsElement.show();
      } else {
        commentsElement.hide();
      }
    });

    function Comment(attributes) {
      this.id = attributes.id;
      this.content = attributes.content;
      this.user_id = attributes.user_id;
      this.song_id = attributes.song_id;
      this.created_at = attributes.created_at;
      this.updated_at = attributes.updated_at;
      this.user = attributes.user;
    }

    Comment.prototype.appendToElement = function(element) {
      var commentString = `

          <ul>
        <li>
           <em> ${this.user.username} said:</em>
           ${this.content}
        </li>
        </ul>
      `;
      element.append(commentString);
    }
  });
</script>
<!-- the end of lukes code -->
