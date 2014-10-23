<?php
namespace Subench\Pages;

use Subench\Entities\TeamEntity;
use Webiny\Component\Http\HttpTrait;
use Webiny\Component\Security\Security;
use Subench\Entities\PlayerEntity;
use Subench\Lib\View;

class Connect
{
    use HttpTrait;

    public function connectPlayer($id)
    {
        $team = $this->_getCurrentTeam();
        $player = PlayerEntity::findById($id);
        $teamPlayers = $team->getAttribute('FBPlayers')->getValue();
        $teamPlayers[] = [
            'Name'   => $player->FirstName . ' ' . $player->LastName,
            'Avatar' => $player->getAttribute('Avatar')->getValue()
        ];

        $team->getAttribute('FBPlayers')->setValue($teamPlayers);
        $team->save();

        $msg = "Congratulations - you're off the bench and will be playing for ".$team->Name."!";

        View::showView('connect.tpl', [
                'team'   => $team->toArray(),
                'player' => $player->toArray(),
                'msg' => $msg
            ], true
        );
    }

    public function connectTeam($id)
    {
        $player = $this->_getCurrentPlayer();
        $team = TeamEntity::findById($id);

        $player->Team = $id;
        $player->save();

        $teamPlayers = $team->getAttribute('FBPlayers')->getValue();
        $teamPlayers[] = [
            'Name'   => $player->FirstName . ' ' . $player->LastName,
            'Avatar' => $player->getAttribute('Avatar')->getValue()
        ];

        $team->getAttribute('FBPlayers')->setValue($teamPlayers);
        $team->save();

        $msg = "Congratulations - ".$player->FirstName." is off the bench and will be playing for you!";

        View::showView('connect.tpl', [
                'team'   => $team->toArray(),
                'player' => $player->toArray(),
                'msg' => $msg
            ], true
        );
    }

    /**
     * @return PlayerEntity
     * @throws \Webiny\Component\Security\Authentication\FirewallException
     * @throws \Webiny\Component\Security\SecurityException
     */
    private function _getCurrentPlayer()
    {
        $user = Security::getInstance()->firewall('Admin')->getUser();
        if (!$user) {
            $this->httpRequest()->redirect($this->router()->generate('Homepage'));
        }
        $players = PlayerEntity::find(['Email' => $user->getUsername()]);

        return $players->getIterator()[0];
    }

    /**
     * @return TeamEntity
     */
    private function _getCurrentTeam()
    {
        $player = $this->_getCurrentPlayer();

        return $player->getAttribute('Team')->getValue();
    }
}