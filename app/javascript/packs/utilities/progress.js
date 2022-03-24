document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector(".barStatus")
  
  if (control) {
   var progress = control.dataset.progress

    control.style.width = progress + '%' 
  }
})
