<?php
declare(strict_types=1);

$forum_theme =  $connection->table('forum_theme')
                   ->leftJoin('cms_forum_rdm', 'forum_theme.id', '!=', 'cms_forum_rdm.topic_id')
                   ->leftJoin('forum_cat', 'forum_theme.cat_id', '=', 'forum_cat.id')
                   ->select("forum_cat.name as catname", "forum_theme.name", "forum_theme.id",  "forum_cat.code as cat_code")
                   ->paginate(20);


$data = [
    'title' => "Yangi mavzular",
    'forum_theme' => $forum_theme,
];
    echo $view->render('forum::yangi', ['data' => $data]);

