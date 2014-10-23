<?php
namespace Subench\Pages;

use Subench\Lib\View;

class Homepage
{
    public function showHomepage()
    {
        View::showView('homepage.tpl');
    }
}