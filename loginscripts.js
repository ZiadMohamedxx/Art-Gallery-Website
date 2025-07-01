const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');
const signUpForm = document.getElementById('signUpForm');
const signInForm = document.getElementById('signInForm');


signUpButton.addEventListener('click', () => {
    container.classList.add('right-panel-active');
    signUpButton.innerText = 'Go to Sign In';
    signInButton.innerText = 'Sign In';
});


signInButton.addEventListener('click', () => {
    container.classList.remove('right-panel-active');
    signInButton.innerText = 'Go to Sign Up';
    signUpButton.innerText = 'Sign Up';
});


signUpForm.addEventListener('submit', (event) => {
    event.preventDefault(); 

   
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    
    if (name && email && password) {
        
        fetch('/signup', {
            method: 'POST',
            body: JSON.stringify({ name, email, password }),
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => {
            if (response.ok) {
                
                alert('Sign-up successful!');
            } else {
                
                alert('Sign-up failed. Please try again.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('An error occurred. Please try again later.');
        });
    } else {
        alert('Please fill in all fields.');
    }
});

var modal = document.getElementById('id01');


window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

