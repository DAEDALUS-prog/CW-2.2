const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
    container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
    container.classList.remove("right-panel-active");
});


function validateForm() {
    var name = document.forms["sign-up"]["name"].value;
    var email = document.forms["sign-up"]["email"].value;
    var password = document.forms["sign-up"]["password"].value;
    
    if (name == "" || email == "" || password == "") {
        alert("Please fill in all fields.");
        return false;
    }

    if (name.length < 3) {
        alert("Please enter a name with at least 3 characters.");
        return false;
    }
    
    if (password.length < 6) {
        alert("Please enter a password with more than 5 characters.");
        return false;
    }

    var xhr = new XMLHttpRequest();
    xhr.open("GET", "/check-email?email=" + email); // Отправляем GET-запрос на сервер
    xhr.onload = function() {
        if (xhr.status === 200) {
            if (xhr.responseText === "true") {
                // Отображаем сообщение об ошибке
                alert("Email already exists");
            } else {
                // Email не существует, продолжаем сабмит формы
                document.forms["sign-up"].submit();
            }
        }
    };
    xhr.send();
    return false; // Возвращаем false, чтобы форма не отправлялась сразу после отправки запроса на проверку email-адреса
}


function checkForm() {
    var email = document.forms["sign-in"]["email"].value;
    var password = document.forms["sign-in"]["password"].value;
    if (email.trim() === "" || password.trim() === "") {
        alert("Please fill in all fields.");
        return false;
    }

    var xhr = new XMLHttpRequest();
    xhr.open("GET", "/check-email?email=" + email); // Отправляем GET-запрос на сервер
    xhr.onload = function() {
        if (xhr.status === 200) {
            if (xhr.responseText === "false") {
                // Отображаем сообщение об ошибке
                alert("Email does not exist");
            } else {
                // Email не существует, продолжаем сабмит формы
                document.forms["sign-in"].submit();
            }
        }
    };
    xhr.send();

    return false;
}


function startPositiveMessage() {
    
}




