<?php
declare(strict_types = 1);

if ($connection->table('forum_cat')->where('code', $category)->doesntExist()){
    pageNotFound();
    exit;
}
$forum_cat =  $connection->table('forum_cat')->where('code', $category)->first();


$forum_theme =  $connection->table('forum_theme')->where('cat_id', $forum_cat->id)->first();

if (!$forum_theme) {
    $errors = 'Umuman mavzular mavjud emas';
    $theme = '';
}else {
    $theme = $forum_theme;
    $errors = '';
}

$data = [
    'title' => $forum_cat->name,
    'errors' => $errors,
    'forum_cat' => $forum_cat,
];


    echo $view->render('forum::category', ['data' => $data]);

