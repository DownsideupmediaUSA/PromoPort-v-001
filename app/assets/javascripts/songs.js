$(function(){ //anonymous function
/////////////COMMENTS SECTION//////////
// server side AJAX model (have server sort out data prior to responding )
      $("a.load_comments").on("click", function(e){
       // 2 fire an ajax request to get data
         $.ajax({
           url: this.href,
           dataType: 'script'
  // 3 place data in DOM (to the page)
         })
// 1 need to hijack submit button and prevent default action
         e.preventDefault();
       })

//////TRACKS ON DASHBOARD/////////

    $("")

});
