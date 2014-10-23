<?php
namespace Subench\Entities;

use Webiny\Component\Entity\EntityAbstract;

class PlayerEntity extends EntityAbstract
{
    protected static $_entityCollection = "Player";

    /**
     * This method is called during instantiation to build entity structure
     * @return void
     */
    protected function _entityStructure()
    {
        $this->attr('FirstName')->char()->setDefaultValue(' ');
        $this->attr('LastName')->char()->setDefaultValue(' ');
        $this->attr('Email')->char()->setDefaultValue(' ');
        $this->attr('Avatar')->char()->setDefaultValue(' ');
        $this->attr('Facebook')->char()->setDefaultValue(' ');
        $this->attr('Position')->char()->setDefaultValue(' ');
        $this->attr('Location')->char()->setDefaultValue(' ');
        $this->attr('FreeDay')->char()->setDefaultValue(' ');
        $this->attr('FreeTime')->char()->setDefaultValue(' ');
        $this->attr('About')->text()->setDefaultValue(' ');
        $this->attr('Team')->many2one()->setEntity('\Subench\Entities\TeamEntity');
    }
}