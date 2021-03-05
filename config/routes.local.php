<?php
declare(strict_types=1);

$map->addRoute(['GET', 'POST'], '/', 'modules/uzforhome/index.php');

$map->addRoute(['GET', 'POST'], '/forum/[{category}/[{id:\d+}/]]', 'modules/forum/index.php');

// $map->addRoute(['GET', 'POST'], '/forum/{category:[\w.+-]+}/[{id:\d+}/]]', 'modules/forum/index.php');

$map->addRoute(['GET', 'POST'], '/forum/admin/{action:[\w.+-]+}/[{id:\d+}/]', 'modules/forum/admin.php');


