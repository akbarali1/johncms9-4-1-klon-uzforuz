<?php
declare(strict_types=1);
use Johncms\System\View\Render;
use Johncms\NavChain;
use Johncms\Users\User;

/** @var User $user */
$user = di(User::class);

if (!$user->isValid()) {
    header('Location: ../login/');
    exit;
}

/** @var NavChain $nav_chain */
$nav_chain = di(NavChain::class);

/** @var Render $view */
$view = di(Render::class);

$connection = \Illuminate\Database\Capsule\Manager::connection();

$tools = di(Johncms\System\Legacy\Tools::class);

$route = di('route');

$view->addFolder('uzforhome', __DIR__ . '/templates/');

$tools = di(Johncms\System\Legacy\Tools::class);

$forum_cat = $connection->table('forum_cat')->where('ichki_cat', '0')->where('cat_id', '0')->get();

foreach ($forum_cat as $item) {

   $ichkicat =  $connection->table('forum_cat')->where('cat_id', $item->id)->get();
   
   $hammasi[] = [
       'name' => $item->name,
       'id' => $item->id,
       'ichkicat' => $ichkicat,
   ];

   $ichkicat = [];
}

// d($hammasi); die;

$data = [
    'title' => 'Uzfor demo versiya',
    'page_title' => 'Bosh sahifa',
    'forum_cat' => $hammasi,
];

echo $view->render('uzforhome::index', ['data' => $data]);
