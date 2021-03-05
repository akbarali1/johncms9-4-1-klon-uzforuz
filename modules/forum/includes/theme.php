<?php
declare(strict_types = 1);
/*
if ($user->rights <= 6){
    echo $view->render(
        'test::result',
        [
            'title'    => "Kirish mumkun emas",
            'message'  => "Bu yerga faqat adminlar kirishi mumkun",
            'type'     => 'error',
            'back_url' => '/',
        ]
    );
    exit;
}
*/
$forum_theme = $connection->table('forum_theme')->where('id', $id)->first();
$forum_cat =  $connection->table('forum_cat')->where('code', $category)->first();
$tashqi_cat =  $connection->table('forum_cat')->where('id', $forum_cat->cat_id)->first();

$create_user_info =  $connection->table('users')->where('id', $forum_theme->user_id)->select('name')->first();



$data = [
    'title' => $forum_theme->name,
    'forum_theme' => $forum_theme,
    'forum_cat' => $forum_cat,
    'create_user_info' => $create_user_info,
    'tashqi_cat' => $tashqi_cat,
    ];

echo $view->render('forum::theme', ['data' => $data]);
