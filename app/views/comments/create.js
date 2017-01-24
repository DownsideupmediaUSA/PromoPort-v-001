$("#comment_content").val("");
alert("did this work?")
var $ol = $("div.comments ol")
$ol.append(render('comments/comment', :comment => @comment));
