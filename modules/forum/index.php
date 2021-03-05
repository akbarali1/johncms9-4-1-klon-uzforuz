<?php
declare(strict_types=1);

use Johncms\System\Http\Request;
use Johncms\Users\User;
use Johncms\System\View\Render;
use Johncms\NavChain;

defined('_IN_JOHNCMS') || die('Error: restricted access');

/** @var User $user */
$user = di(User::class);

/** @var Render $view */
$view = di(Render::class);

/** @var NavChain $nav_chain */
$nav_chain = di(NavChain::class);

/** @var Request $request */
$request = di(Request::class);

$route = di('route');

$connection = \Illuminate\Database\Capsule\Manager::connection();

$view->addFolder('forum', __DIR__ . '/templates/');

$id = $route['id'] ?? '';
$category = $route['category'] ?? '';

$config = di('config')['johncms'];

if (! empty($id)) {
    require 'includes/theme.php';
} elseif (! empty($category)) {
    require 'includes/category.php';
}else{
    header('Location: ../?');
    die;
}