<main>
            <p class="head-line">Статьи пользователей</p>
                <div class="main-div">
            <?php
                
                viewUpdate($_GET["id"]);

                $articleArray = getArticles();
                foreach ($articleArray as $articleSingle) { ?>

                <?php 
                    $login = getAuthorById($articleSingle["author_id"]);
                    $commentCounter = commentCounterForBlog($articleSingle["article_id"]);
                ?>

                        <article class="blog">
                            <h1 class="blog-header"><a href="/article.php?id=<?php echo $articleSingle["article_id"]; ?>"><?php echo $articleSingle["header"]; ?></a></h1>
                            <div class="blog-main">
                                <h2><?php echo $articleSingle["text"]; ?></h2>                                
                            </div>
                            <div class="blog-footer">
                                <p class="author">Автор: <?php echo $login; ?></p>
                                <p class="date"><?php echo date('d.m.Y в H:m', strtotime($articleSingle["date"])); ?></p>
                                <div>
                                    <p class="comment">
                                        <img src="img/iconfinder_bubble_chat_comment_message_outline_talk_392521.png"><?php echo $commentCounter; ?>
                                    </p>
                                    <p class="views">
                                        <img src="img/iconfinder_eye_preview_see_seen_view_392505.png"><?php echo $articleSingle["views"]; ?>
                                    </p>
                                </div>
                            </div>
                        </article> 
                 
            <?php } ?>
            </div>
        </main>

    </body>