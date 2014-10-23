<?php
namespace Subench\Lib;

use Webiny\Component\TemplateEngine\TemplateEngineTrait;

class View
{
    use TemplateEngineTrait;

    static public function showView($view, $data = [], $hasHeader = false, $master = true)
    {
        $data = array_merge($data, [
                '_viewTpl'   => $view,
                '_hasHeader' => $hasHeader
            ]
        );
        if($master){
            self::templateEngine()->render('master.tpl', $data);
        }else{
            self::templateEngine()->render($view, $data);
        }
    }
}