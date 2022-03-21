document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.check-password')

  if (control) { control.addEventListener('input', checkPasswordConfirmation) }
})

function checkPasswordConfirmation() {
  var passwordConfirmation = document.getElementById('password_confirmation').value
  
  if (passwordConfirmation) {
    comparePasswords()
  } else {
    document.getElementById('message').innerHTML = ''
    document.querySelector('.octicon-alert').classList.add('hide')
    document.querySelector('.octicon-check-circle').classList.add('hide')
  }
}

function comparePasswords() {
  var password = document.getElementById('password').value
  var passwordConfirmation = document.getElementById('password_confirmation').value

  if (password !== passwordConfirmation) {
    document.getElementById('message').style.color = 'red'
    document.getElementById('message').innerHTML = 'not matching'
    document.querySelector('.octicon-alert').classList.remove('hide')
    document.querySelector('.octicon-check-circle').classList.add('hide')
  } else {
    document.getElementById('message').style.color = 'green'
    document.getElementById('message').innerHTML = 'matching'
    document.querySelector('.octicon-alert').classList.add('hide')
    document.querySelector('.octicon-check-circle').classList.remove('hide')
  }
}
