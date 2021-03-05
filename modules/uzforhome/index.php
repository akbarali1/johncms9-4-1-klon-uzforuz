<?php
declare(strict_types=1);
use Johncms\System\View\Render;
use Johncms\NavChain;
use Johncms\Users\User;
use Illuminate\Support\Str;
/** @var User $user */
$user = di(User::class);

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

foreach ($ichkicat as $item1) {
    if ($item1->code == 'pustoy') {
        $connection->table('forum_cat')->where('id', '=', $item1->id)->update(['code' => Str::slug($item1->name)]);
       }
    $ichkicat1[] = [
        'name' => $item1->name,
        'id' => $item1->id,
        'tushuncha' => $item1->tushuncha,
        'code' => $item1->code,
    ];
}
   
   $hammasi[] = [
       'name' => $item->name,
       'id' => $item->id,
       'ichkicat' => $ichkicat,
       'ichkicat' => $ichkicat1,
   ];
   $ichkicat1 = [];
}

// d($hammasi); die;

$data = [
    'title' => 'Uzfor demo versiya',
    'page_title' => 'Bosh sahifa',
    'forum_cat' => $hammasi,
];

echo $view->render('uzforhome::index', ['data' => $data]);


