<?php
declare(strict_types = 1);
use Johncms\System\Legacy\Bbcode;

$bbcode = di(Bbcode::class);
$data = [
    'fields' => [
    'name'              => $request->getPost('name', '', FILTER_SANITIZE_STRING),
    'message'        => $request->getPost('message', ''),
    'bbcode'            => $bbcode->buttons('form', 'theme_text'),
    ],
];
    $data['form_data'] = array_map('trim', $data['fields']);

    if ($request->getMethod() === 'POST') {

        if (empty($errors)) {
            $connection->table('forum_cat')->insertGetId(
                [
                    'name' => $data['fields']['catname'],
                    'cat_id' => $data['fields']['ichki_cat'],
                    'tushuncha' => $data['fields']['msg'],
                    'ichki_cat' => '1',
                    'created_userid' => $user->id,
                    'time' => date("Y-m-d H"),
                ]
            );
            $_SESSION['success_message'] = 'O`quvchi muvafaqiyatli saqlandi';
          // echo 'O`quvchi bazaga saqlandi'; die;
        }
    }
    $errors = [];
    $data['errors'] = $errors;
    $title = 'Mavzu ochish';
    $data['title'] = $title;

    echo $view->render('forum::admin/adtheme', ['data' => $data]);