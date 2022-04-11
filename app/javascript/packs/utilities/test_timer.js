document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector(".testTimer")
  if (control) {
    var testTime = 0.5
    var saved_countdown = localStorage.getItem('saved_countdown')

    if (saved_countdown == null) {
      var new_countdown = new Date().getTime() + testTime * 60000
      testTime = new_countdown
      localStorage.setItem('saved_countdown', new_countdown)
    } else {
      testTime = saved_countdown
    }

    var x = setInterval(() => {
      var now = new Date().getTime()
      var distance = testTime - now

      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))
      var seconds = Math.floor((distance % (1000 * 60)) / 1000)

      control.innerHTML = "До конца теста осталось: " + minutes + ":" + seconds

      if (distance <= 0) {
        clearInterval(x);
        localStorage.removeItem('saved_countdown')
        control.innerHTML = "Время для прохождения теста вышло!"
        control.style.color = 'red'
        setTimeout(function() { window.location.replace(location.origin + '/test_passages/' + control.dataset.id + '/result') }, 3000)
      }
    }, 1000)
  }
})
