"use strict"

/* VARS */

var passwordInputEl = document.getElementById('password-input');
var passwordInputRepeatEl = document.getElementById('password-input-repeat');
var showHidePasswordButton = document.getElementById('show-hide-botton');
var showHidePasswordButtonWithRepeat = document.getElementById('show-hide-botton-with-repeat');
var SliderPicEl = document.getElementById('slide-img');
var buttonPrefSlideEl = document.getElementById('pref-button');
var buttonNextSlideEl = document.getElementById('next-button');
var signatureSliderEl = document.getElementById('signature-slider');
var picturesArray = ['LOGO.jpg','gX9X4Y5PrU4.jpg', 'SeqT71Xp5nY.jpg', 'dsHmxg0mVC0.jpg', 'oqbGovo573A.jpg', '5VbVGwRpxVA.jpg', 'bNvXkmq8WOc.jpg', '6Hr1_Cn44g0.jpg']
var signatureArray = ['Логотип нарисованный в пейнте', 'Водухотворенная личность', 'Любитель рыбалки', 'hakerman', 'Маринад кефирный: кефир, чеснок, лук, зелень, соль, перец', 'Человек искусства', 'Хорошо подбираю слова', 'Костровик третьего разряда']
var currentPictureSlider = 0;
var inputsEl = document.getElementsByClassName('reg-log-input');


/* CHECK FOR INPUTS PASSWORD ERROR */

if (passwordInputEl !== null) {
    passwordInputEl.addEventListener('keyup', checkForCorrectPassword);
}
if(passwordInputRepeatEl !== null) {
    passwordInputRepeatEl.addEventListener('keyup', checkForCorrectPasswordRepeat);
}

/* BUTTON CHECK FOR SHOW/HIDE PASSWORD */

if (showHidePasswordButton !== null) {
    showHidePasswordButton.addEventListener('click', showHidePassword);
} else if(showHidePasswordButtonWithRepeat !== null) {
    showHidePasswordButtonWithRepeat.addEventListener('click', showHidePassword);
}

/* BUTTON CHECK FOR SLIDER */

if (buttonPrefSlideEl !== null & buttonNextSlideEl !== null) {
    buttonPrefSlideEl.addEventListener('click', changeSliderPic);
    buttonNextSlideEl.addEventListener('click', changeSliderPic);
} 

/* CHECK FOR INPUTS */

for (let i = 0; i < inputsEl.length; i++) {
    var finedInput = inputsEl[i];
    finedInput.addEventListener('focus', hidePlaceholder);    
}

/* FUNCTIONS */

function showHidePassword(eventObject) {
    var clickedElement = eventObject.currentTarget;

    if (clickedElement === showHidePasswordButton) {
        if (passwordInputEl.type === 'password') {
            showHidePasswordButton.innerHTML = 'Скрыть пароль';
            passwordInputEl.type = 'text';
        } else {
            showHidePasswordButton.innerHTML = 'Показать пароль';
            passwordInputEl.type = 'password';
        }   
    } else if (clickedElement === showHidePasswordButtonWithRepeat) {
        if (passwordInputEl.type === 'password') {
            showHidePasswordButtonWithRepeat.innerHTML = 'Скрыть пароль';
            passwordInputEl.type = 'text';
            passwordInputRepeatEl.type = 'text';
        } else {
            showHidePasswordButtonWithRepeat.innerHTML = 'Показать пароль';
            passwordInputEl.type = 'password';
            passwordInputRepeatEl.type = 'password';
        }   
    }
}

function changeSliderPic(eventObject) {
    var clickedElement = eventObject.currentTarget;
    var buttonOfSlider = clickedElement.className;

    if (buttonOfSlider === 'next-button') {
        currentPictureSlider = currentPictureSlider === (picturesArray.length - 1) ? 0 : ++currentPictureSlider;
    } else {
        currentPictureSlider = currentPictureSlider === 0 ? (picturesArray.length - 1) : --currentPictureSlider;
    }

    signatureSliderEl.innerHTML = signatureArray[currentPictureSlider];
    SliderPicEl.src = 'img/' + picturesArray[currentPictureSlider];
}

function hidePlaceholder(eventObject) {
    var clickedElement = eventObject.currentTarget;
    clickedElement.placeholder = '';
}

function checkForCorrectPassword(eventObject) {
    var keyDownElement = eventObject.currentTarget;
    var inputValue = keyDownElement.value;
    var letters = /[a-z]/;
    var numbers = /[0-9]/;
    var lettersUpper = /[A-Z]/;
    
    if (inputValue.length >= 8 && inputValue.match(numbers) && (inputValue.match(letters) || inputValue.match(lettersUpper))) {
        keyDownElement.className = 'reg-log-input';
    } else {
        keyDownElement.className = 'password-error';
    }
    
}

function checkForCorrectPasswordRepeat(eventObject) {
    var keyDownElement = eventObject.currentTarget;
    var inputValue = keyDownElement.value;
    var mainPassword = passwordInputEl;
    var mainPasswordValue = mainPassword.value;

    if (inputValue === mainPasswordValue) {
        keyDownElement.className = 'reg-log-input';
        mainPassword.className = 'reg-log-input';        
    } else {
        keyDownElement.className = 'password-error';
        mainPassword.className = 'password-error';
    }
 }