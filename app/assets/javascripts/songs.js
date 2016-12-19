$(function(){ //anonymous function
// 1 need to hijack submit button and prevent default action
 // 2 fire an ajax request to get data
 // 3 place data in DOM (to the page)

   // what we do when we successfully receive the data



      // need to load data to DOM



      $("a.load_comments").on("click", function(e){
         $.ajax({
           url: this.href,
           dataType: 'script'
         })

         e.preventDefault();
       })
     
});
