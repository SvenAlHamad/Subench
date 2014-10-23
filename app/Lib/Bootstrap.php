<?php
namespace Subench\Lib;

use Webiny\Component\Http\HttpTrait;
use Webiny\Component\Router\RouterTrait;
use Webiny\Component\StdLib\StdLibTrait;

class Bootstrap
{
    use RouterTrait, StdLibTrait, HttpTrait;

    public function __construct()
    {
        // current url
        $currentUrl = $this->httpRequest()->getCurrentUrl();

        // init the router
        try{
            $result = $this->router()->match($currentUrl);
            $this->router()->execute($result);
        }catch (\Exception $e){
            print_r($e);
            die('<h1>Opps ... page not found</h1>');
        }
    }
}