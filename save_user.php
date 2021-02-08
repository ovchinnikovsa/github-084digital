<?php
    if (isset($_POST['login'])) { $login = $_POST['login']; if ($login == '') { unset($login);} } //заносим введенный пользователем логин в переменную $login, если он пустой, то уничтожаем переменную
    if (isset($_POST['password'])) { $password=$_POST['password']; if ($password =='') { unset($password);} }
    //заносим введенный пользователем пароль в переменную $password, если он пустой, то уничтожаем переменную
    if (empty($login) or empty($password)) //если пользователь не ввел логин или пароль, то выдаем ошибку и останавливаем скрипт
        {
        exit ("Вы ввели не всю информацию, вернитесь назад и заполните все поля!");
        }
    //если логин и пароль введены, то обрабатываем их, чтобы теги и скрипты не работали, мало ли что люди могут ввести
    $login = stripslashes($login);
    $login = htmlspecialchars($login);
    $password = stripslashes($password);
    $password = htmlspecialchars($password);
 //удаляем лишние пробелы
    $login = trim($login);
    $password = trim($password);
 // подключаемся к базе
    require_once'db.php';

    echo "121";

    $loginTest = getAuthorById('1');

    echo $loginTest;

    try {
        // Проверяем, заполнены ли поля HTML-формы
        if (empty($_POST['login'])) exit('Не заполнено поле "логин"');
        if (empty($_POST['password'])) exit('Не заполнено поле "пароль"');
    
        // Добавляем новостное сообщение в таблицу news
        $query = "INSERT INTO 'authors' ('login', 'password') VALUES (:login, :password)";
        $params = [
            ':login' => $login,
            ':password' => $password
        ];
        $authors = $pdo->prepare($query);
        $authors->execute($params);

        /*$query = "INSERT INTO `categories` (`name`) VALUES (:name)";
        $params = [
            ':name' => $name
        ];
        $stmt = $pdo->prepare($query);
        $stmt->execute($params); */
    
        // Получаем только что сгенерированный идентификатор news_id
        $author_id = $pdo->lastInsertId();
    
        // Вставляем содержимое новостного сообщения в таблицу news_contents.
        // Формируем запросы
        /* $query = "INSERT INTO news_contents
                  VALUES (NULL, :content, :news_id)";
        $news = $pdo->prepare($query);
        $news->execute(['content' => $_POST['content'], 'news_id' => $news_id]); */
    
        // Осуществляем переадресацию на главную страницу
        header("Location: http://084digital/index.php");
      } catch (PDOException $e) {
        echo "Ошибка выполнения запроса: " . $e->getMessage();
      }
    /* $result = $db->query("SELECT author_id FROM authors WHERE login='$login'",$db); */
    /* $myrow = mysql_fetch_array($result); */
    /* $myrow = $result->fetch(PDO::FETCH_ASSOC);
    if (!empty($myrow['author_id'])) {
        exit ("Извините, введённый вами логин уже зарегистрирован. Введите другой логин.");
    } */
 // если такого нет, то сохраняем данные
    /* $authors = mysql_query ("INSERT INTO authors (login,password) VALUES('$login','$password')");
    // Проверяем, есть ли ошибки
    if ($result2=='TRUE')
    {
        echo "Вы успешно зарегистрированы! Теперь вы можете зайти на сайт. <a href='index.php'>Главная страница</a>";
    }
    else {
        echo "Ошибка! Вы не зарегистрированы.";
    } */
?>