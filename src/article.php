<?php require_once'header.php';

$article = getArticleById($_GET["id"]);
$author_name = getAuthorById($article["author_id"]);
$commentArray = getCommentByArticleId($_GET["id"]);
viewUpdate($_GET["id"]);
?>

        <div class="article-page">
            <h1 class="blog-header"><?php echo $article["header"]; ?></h1>
            <p class="author">Автор: <?php echo $author_name; ?></p>
            <p class="date"><?php echo date('d.m.Y в H:m', strtotime($article["date"])); ?></p>
            <div class="blog-main">
                <img class="article-img" src="<?php echo $article["article_img"]; ?>">
                <h2><?php echo $article["text"]; ?></h2>
            </div>

            <div class="comments-section">
                <h2 class="blog-header">Коментарии</h2>

                <?php foreach ($commentArray as $comment) {

                    $author_avatar = getAuthorAvatarByIdForComment($comment["author_id"]);
                    $author_name_for_comment = getAuthorByIdForComment($comment["author_id"]); ?>
                    
                    <div class="comment">
                            <div class="com-header">
                                <img id="avatar-mini" src="<?php echo $author_avatar; ?>">
                                <p class="nickname"><?php echo $author_name_for_comment; ?></p>                    
                            </div>
                            <p><?php echo $comment["comment"]; ?></p>
                    </div>

                <?php } ?>
                                    
                <textarea name="add-comment-text" cols="100" rows="15" wrap="virtual" placeholder="Введите ваш комментарий"></textarea>
                <p><a id="add-comment" href="#">Отправить коментарий</a></p>
            </div>
        </div>

   </body>

<?php require_once'footer.php' ?>