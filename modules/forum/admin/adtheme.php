<?php
declare(strict_types = 1);
use Johncms\System\Legacy\Bbcode;

$forum_cat =  $connection->table('forum_cat')->where('id', $id)->first();
$data = [
    'fields' => [
    'name'              => $request->getPost('name', '', FILTER_SANITIZE_STRING),
    'message'        => $request->getPost('message', ''),
    ],
];
    $data['form_data'] = array_map('trim', $data['fields']);
    if ($request->getMethod() === 'POST') {

        if (empty($errors)) {
            $connection->table('forum_theme')->insertGetId(
                [
                    'name' => $data['fields']['name'],
                    'cat_id' => $id,
                    'user_id' => $user->id,
                    'theme_text' => $data['fields']['message'],
                    'time' => date("Y-m-d H"),
                ]
            );
            $_SESSION['success_message'] = 'Mavzu muvafaqiyatli yaratildi';
          // echo 'O`quvchi bazaga saqlandi'; die;
        }
    }
    $errors = [];
    $data['errors'] = $errors;
    $title = 'Mavzu ochish';
    $data['title'] = $title;
    $data['forum_cat'] = $forum_cat;

    echo $view->render('forum::admin/adtheme', ['data' => $data]);