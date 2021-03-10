<?php
declare(strict_types = 1);
use Johncms\System\Legacy\Bbcode;
$bbcode = di(Bbcode::class);

$forum_theme = $connection->table('forum_theme')->where('id', $id)->first();
$forum_cat =  $connection->table('forum_cat')->where('code', $category)->first();
$tashqi_cat =  $connection->table('forum_cat')->where('id', $forum_cat->cat_id)->first();

$username =  $connection->table('users')->where('id', $forum_theme->user_id)->select("name")->first();

$forum_messages =  $connection->table('forum_messages')->where('topic_id', $forum_theme->id)->paginate(10);

$create_user_info =  $connection->table('users')->where('id', $forum_theme->user_id)->select('name')->first();

$tools = di(Johncms\System\Legacy\Tools::class);

if (isset($forum_messages)) {
foreach ($forum_messages as $message) {
        # code...
        $messages[] = [
            'name' => $message->user_name,
            'id' => $message->id,
            'text' => $tools->checkout($message->text, 1, 1),
            'user_id' => $message->user_id,
            'date' => $tools->displayDate($message->date),
        ];
    }
}
if (empty($messages)) {
    $messages = 'toza';
    # code...
}
    
$data = [
    'title' => $forum_theme->name,
    'forum_theme' => $forum_theme,
    'forum_cat' => $forum_cat,
    'create_user_info' => $create_user_info,
    'tashqi_cat' => $tashqi_cat,
    'messages' => $messages,
    'username' => $username->name,
    'pagination' => $forum_messages->render(),
    'bbcode' => $bbcode->buttons('form', 'message'),
    ];

echo $view->render('forum::theme', ['data' => $data]);
