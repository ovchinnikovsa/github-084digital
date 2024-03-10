<?php require_once'header.php' ?>

        <div class="registration">
            <div>
                <p>Логин</p>
                <input required class="reg-log-input" type="email" placeholder="Введите эл. почту">
            </div>
            <div>
                <p>Пароль</p>
                <input required id="password-input" class="reg-log-input" type="password" placeholder="Введите пароль">
            </div>
            <div class="registraton-buttons" id="show-hide-botton">Показать пароль</div>
            <div class="registraton-buttons"><a  href="#">Вход</a></div>
            <div class="registraton-buttons"><a  href="#">Забыли пароль?</a></div>
            <div class="registraton-buttons"><a  href="registration.php">Регистрация</a></div>
        </div>

   </body>

<?php require_once'footer.php' ?>