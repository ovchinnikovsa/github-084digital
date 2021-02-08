<?php require_once'header.php';
require_once'save_user.php';
 ?>

<div class="registration">
    <div class="reg-forms">
        <form action="save_user.php" method="post">
            <p>
                <label>Ваш логин:<br></label>
                <input  required class="reg-log-input" name="login" type="text" size="15" maxlength="15" placeholder="login">
            </p>
            <p>
                <label>Ваша почта:<br></label>
                <input required class="reg-log-input" name="email" type="text" size="15" maxlength="15" placeholder="ivanivanov@gmail.com">
            </p>
            <p>
                <label>Ваш пароль:<br></label>
                <input required id="password-input" class="reg-log-input"  name="password" type="password" size="15" maxlength="15" placeholder="1234567a">
            </p>
            <p>
                <label>Повторите пароль:<br></label>
                <input required id="password-input-repeat" class="reg-log-input" type="password" name="password" size="15" maxlength="15" placeholder="1234567a">
            </p>
            <div class="registraton-buttons" id="show-hide-botton-with-repeat">Показать пароль</div>
            <p>
                <input class="registraton-buttons" type="submit" name="submit" value="Регистрация">
            </p>
        </form>
    </div>
</div>
        
<?php require_once'footer.php' ?>