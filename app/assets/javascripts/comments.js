$(function() {
  $("form#new_comment").on("submit", function(e) {
    e.preventDefault()
    console.log("Did this hijack work?")
    })
  })
