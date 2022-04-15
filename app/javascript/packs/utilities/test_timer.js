document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector(".testTimer")
  if (control) {
    var testTime = parseInt(control.dataset.timer * 60)
    var startTime = parseInt(control.dataset.start)
    var endTime = (startTime + testTime) * 1000

    var x = setInterval(() => {
      var now = +new Date
      var distance = endTime - now

      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))
      var seconds = Math.floor((distance % (1000 * 60)) / 1000)

      control.innerHTML = "До конца теста осталось: " + minutes + ":" + seconds

      if (distance <= 0) {
        clearInterval(x);
        control.innerHTML = "Время для прохождения теста вышло!"
        control.style.color = 'red'
        setTimeout(function() {
         var form = document.getElementById('test-form')
         form.submit()
        }, 3000)
      }
    }, 1000)
  }
})
