<?php
declare(strict_types = 1);
    $data = [
        'fields'     => [
            'catname'          => $request->getPost('catname', '', FILTER_SANITIZE_STRING),
            'msg'          => $request->getPost('msg', '', FILTER_SANITIZE_STRING),
            'ichki_cat'          => $request->getPost('ichki_cat', '', FILTER_VALIDATE_INT),
        ],
    ];



    $data['fields'] = array_map('trim', $data['fields']);

    if ($request->getMethod() === 'POST') {

        if (empty($data['fields']['catname'])) {
            $errors[] = 'Nomni yozishingiz shart';
        }
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
    $title = 'Kategoriya qo`shish';
    $data['title'] = $title;

    $forum_cat = $connection->table('forum_cat')->where('ichki_cat', '0')->get();

    $data['forum_cat'] = $forum_cat;


    echo $view->render('forum::adcat', ['data' => $data]);

