<?php
namespace Subench\Entities;

use Webiny\Component\Entity\EntityAbstract;

class TeamEntity extends EntityAbstract
{
    protected static $_entityCollection = "Team";

    /**
     * This method is called during instantiation to build entity structure
     * @return void
     */
    protected function _entityStructure()
    {
        $this->attr('Name')->char()->setDefaultValue(' ');
        $this->attr('About')->text()->setDefaultValue(' ');
        $this->attr('Facebook')->char()->setDefaultValue(' ');
        $this->attr('Size')->char()->setDefaultValue(' ');
        $this->attr('Players')->one2many('Team')->setEntity('\Subench\Entities\PlayerEntity');
        $this->attr('Location')->char()->setDefaultValue(' ');
        $this->attr('FreeDay')->char()->setDefaultValue(' ');
        $this->attr('FreeTime')->char()->setDefaultValue(' ');
        $this->attr('FBPlayers')->arr()->setDefaultValue([]);
    }
}