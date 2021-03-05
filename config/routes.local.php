<?php

declare(strict_types=1);
/**
 * @var FastRoute\RouteCollector $map
 */

// Пример файла для маршрутов дополнительных модулей.
// Для использования файла, убрать расширение .example
// Должно получиться routes.local.php

$map->addRoute(['GET', 'POST'], '/', 'modules/uzforhome/index.php');

$map->addRoute(['GET', 'POST'], '/forum/[{action}/[{id:\d+}/]]', 'modules/forum/index.php');


