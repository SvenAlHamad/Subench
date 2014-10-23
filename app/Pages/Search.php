<?php
namespace Subench\Pages;

use Subench\Entities\PlayerEntity;
use Subench\Entities\TeamEntity;
use Subench\Lib\View;
use Webiny\Component\Http\HttpTrait;

class Search
{
    use HttpTrait;

    public function searchPlayer()
    {
        $results = PlayerEntity::find([]);

        View::showView('searchPlayer.tpl', ['results' => $results], true);
    }

    public function searchPlayerRefresh()
    {
        $filters = $this->_getFilters();
        $results = PlayerEntity::find($filters);
        View::showView('./partials/playerListItem.tpl', ['players' => $results], false, false);
    }

    public function searchTeam()
    {
        $results = TeamEntity::find([])->toArray();

        View::showView('searchTeam.tpl', ['results' => $results], true);
    }

    public function searchTeamRefresh()
    {
        $filters = $this->_getFilters();
        $results = TeamEntity::find($filters)->toArray();
        View::showView('./partials/teamListItem.tpl', ['teams' => $results], false, false);
    }

    private function _getFilters()
    {
        $filters = [];

        // free day
        if ($this->httpRequest()->query('day')) {
            $filters['FreeDay'] = $this->httpRequest()->query('day');
        }

        // time
        if ($this->httpRequest()->query('time')) {
            $filters['FreeTime'] = $this->httpRequest()->query('time');
        }

        // location
        if ($this->httpRequest()->query('location')) {
            $filters['Location'] = $this->httpRequest()->query('location');
        }

        // position
        if ($this->httpRequest()->query('position')) {
            $filters['Position'] = $this->httpRequest()->query('position');
        }

        return $filters;
    }
}