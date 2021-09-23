<?php

//declare(strict_types=1);

//@ini_set('upload_max_size', '20MB');
//@ini_set('post_max_size', '25MB');
//@ini_set('memory_limit', '30MB');

use App\Kernel;

require_once dirname(__DIR__).'/vendor/autoload_runtime.php';

return function (array $context) {
    return new Kernel($context['APP_ENV'], (bool) $context['APP_DEBUG']);
};
