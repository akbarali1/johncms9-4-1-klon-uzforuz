<?php
declare(strict_types = 1);
$user_agent = $request->getServer('HTTP_USER_AGENT', '', FILTER_SANITIZE_STRING);
$httpReferer = $request->getServer('HTTP_REFERER', '', FILTER_SANITIZE_STRING);
if ($request->getMethod() === 'POST') {
  $message =  $request->getPost('message', '', FILTER_SANITIZE_STRING);
  $themeid =  $request->getPost('themeid', '', FILTER_VALIDATE_INT);
//d($message); die;
    $id = $connection->table('forum_messages')->insertGetId(
        [
            'topic_id' => $themeid,
            'date' => time(),
            'text' => $message,
            'user_id' => $user->id,
            'user_name' => $user->name,
            'user_agent' => $user_agent,
        ]
    );
    header('Location: '.$httpReferer);
}else{
    echo 'bosh sahifaga o`ting';
}

