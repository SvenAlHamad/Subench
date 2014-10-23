<?php

// composer autoloader
require_once '../vendor/autoload.php';

// ###############
// bootstrap start
// ###############

\Webiny\Component\ClassLoader\ClassLoader::getInstance()
    ->registerMap([
                      'Subench\\'=>__DIR__
                  ]);

\Webiny\Component\Router\Router::setConfig('./Configs/Routes.yaml');
\Webiny\Component\Mongo\Mongo::setConfig('./Configs/Mongo.yaml');
\Webiny\Component\Entity\Entity::setConfig('./Configs/Entity.yaml');
\Webiny\Component\TemplateEngine\TemplateEngine::setConfig('./Configs/TemplateEngine.yaml');
\Webiny\Component\OAuth2\OAuth2::setConfig('./Configs/OAuth2.yaml');
\Webiny\Component\Crypt\Crypt::setConfig('./Configs/Crypt.yaml');
\Webiny\Component\Security\Security::setConfig('./Configs/Security.yaml');

// init bootstrap
$bootstrap = new \Subench\Lib\Bootstrap();
