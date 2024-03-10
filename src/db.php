<?php

error_reporting(0);

$ini_file = parse_ini_file(__DIR__ . '/db.ini');

$db_host = $ini_file['DB_HOST'];
$db_name = $ini_file['MARIADB_DATABASE'];
$db_user = $ini_file['MARIADB_USER'];
$db_pass = $ini_file['MARIADB_PASSWORD'];
$db_dns = 'mysql:host=' . $db_host . ';dbname=' . $db_name;

try {
    $db = new PDO($db_dns, $db_user, $db_pass);
} catch (PDOException $e) {
    die('Error, try again later');
}

function getArticles(){
    global $db;
    $articles = $db->query("SELECT * FROM articles");
    return $articles;
}

function getAuthorById($id){
    global $db;
    $authors = $db->query("SELECT * FROM authors WHERE $id = author_id");
    foreach ($authors as $id => $author) {
        if ($author["author_id"] === $author[$id]){            
            return $author["login"];
        } else {
            continue;
        } 
    }
}

function getArticleById($id){
    global $db;
    $articles = $db->query("SELECT * FROM articles WHERE $id = article_id");
    foreach ($articles as $id => $article) {
        if ($article["article_id"] === $article[$id]){            
            return $article;
        } else {
            continue;
        } 
    }
}

function viewUpdate($id){
    global $db;
    $db->query("UPDATE articles SET views = views + 1 WHERE $id = article_id");
}

function getCommentByArticleId($id){
    global $db;
    $commentArray = $db->query("SELECT * FROM comments WHERE $id = article_id_comments");
    return $commentArray;
}

function getAuthorAvatarByIdForComment($id){
    global $db;
    $authors = $db->query("SELECT * FROM authors WHERE $id = author_id");
    foreach ($authors as $id => $author) {
        if ($author["author_id"] === $author[$id]){            
            return $author["avatar_author"];
        } else {
            continue;
        } 
    }
}

function getAuthorByIdForComment($id){
    global $db;
    $authors = $db->query("SELECT * FROM authors WHERE $id = author_id");
    foreach ($authors as $id => $author) {
        if ($author["author_id"] === $author[$id]){            
            return $author["login"];
        } else {
            continue;
        } 
    }
}

function commentCounterForBlog($id){
    global $db;
    $commentsArray = $db->query("SELECT * FROM comments WHERE $id = article_id_comments");
    $i = 0;
    foreach ($commentsArray as $commentSingle) {
        $i++;
    }
    return $i;
}

/* function commentUpdate($id){
    global $db;
    $db->query("UPDATE articles SET views = views + 1 WHERE $id = article_id");
} */