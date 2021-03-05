<?php

declare(strict_types=1);

use Johncms\System\Http\Request;
use Johncms\Users\User;
use Johncms\System\View\Render;
use Johncms\NavChain;
use Johncms\System\i18n\Translator;

defined('_IN_JOHNCMS') || die('Error: restricted access');

/** @var User $user */
$user = di(User::class);
$config = di('config')['johncms'];

if (!$user->isValid()) {
    header('Location: '.$config['homeurl'].'/login/');
    exit;
}

/** @var Render $view */
$view = di(Render::class);

/** @var NavChain $nav_chain */
$nav_chain = di(NavChain::class);

/** @var Request $request */
$request = di(Request::class);

$route = di('route');
$connection = \Illuminate\Database\Capsule\Manager::connection();

// Register Namespace for module templates
$view->addFolder('forum', __DIR__ . '/templates/');

$id = $route['id'] ?? '';
$act = $route['action'] ?? '';

// Register the module languages domain and folder
di(Translator::class)->addTranslationDomain('forum', __DIR__ . '/locale');

$config = di('config')['johncms'];

switch ($act) {

    case 'adtheme':
        require 'admin/adtheme.php';
        break;

    default:
    echo 'default/';
       // header('Location: ../?');
        break;
}