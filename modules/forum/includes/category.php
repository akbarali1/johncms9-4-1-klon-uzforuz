<?php
declare(strict_types = 1);

if ($connection->table('forum_cat')->where('code', $category)->doesntExist()){
    pageNotFound();
    exit;
}
$forum_cat =  $connection->table('forum_cat')->where('code', $category)->first();


$forum_theme =  $connection->table('forum_theme')->where('cat_id', $forum_cat->id)->paginate(20);

foreach ($forum_theme as $theme) {
$create_user_info =  $connection->table('users')->where('id', $theme->user_id)->select('name')->first();

    $themes[] = [
        'name' => $theme->name,
        'id' => $theme->id,
        'time' => $theme->time,
        'user_id' => $theme->user_id,
        'user_name' => $create_user_info->name,
    ];
}


$data['paginate'] = $forum_theme->render(); 

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
    'themes' => $themes,
];
    echo $view->render('forum::category', ['data' => $data]);

