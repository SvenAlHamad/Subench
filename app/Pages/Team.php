<?php

namespace Subench\Pages;

use Subench\Entities\PlayerEntity;
use Subench\Entities\TeamEntity;
use Subench\Lib\View;
use Webiny\Component\EventManager\EventManagerTrait;
use Webiny\Component\Http\HttpTrait;
use Webiny\Component\OAuth2\OAuth2User;
use Webiny\Component\Router\RouterTrait;
use Webiny\Component\Security\Security;

class Team
{
    use HttpTrait, EventManagerTrait, RouterTrait;

    public function login()
    {
        if ($this->httpRequest()->query('error')) {
            // redirect him to homepage
            $this->httpRequest()->redirect($this->router()->generate('Homepage'));
        }

        $this->httpSession()->delete('team');
        $this->eventManager()->listen('wf.security.user.oauth2')->handler($this)->method('facebookRegisterCallback');
        Security::getInstance()->firewall('Admin')->processLogout();
        $result = Security::getInstance()->firewall('Admin')->getUser()->isAuthenticated();

        if (!$result) {
            $result = Security::getInstance()->firewall('Admin')->processLogin('FacebookTeam');
        }

        if ($this->httpSession()->get('team')) {
            $user = unserialize($this->httpSession()->get('team'));
            $player = new PlayerEntity();
            $player->FirstName = $user->getFirstName();
            $player->LastName = $user->getLastName();
            $player->Email = $user->email;
            $player->Avatar = $user->getAvatarUrl();
            $player->Facebook = 'https://www.facebook.com/' . $user->profileId;
            $player->save();

            // assign that player to the new team
            $team = new TeamEntity();
            $team->Players->add($player);
            $team->save();

            // redirect to create account
            $this->httpRequest()->redirect($this->router()->generate('RegisterTeamForm'));
        } else {
            // redirect to listing
            $this->httpRequest()->redirect($this->router()->generate('SearchPlayer'));
        }
    }

    public function facebookRegisterCallback($event)
    {
        /**
         * @var $user OAuth2User
         */
        $user = $event->getUser();
        $players = PlayerEntity::find(['Email' => $user->email]);
        // check if we already have the player
        if ($players->count() < 1) {
            $this->httpSession()->save('team', serialize($user));
            $this->httpSession()->save('oauth', serialize($event->getOAuth2Instance()));
        }
    }

    public function registerForm()
    {
        $player = $this->_getCurrentPlayer();

        // get all fb friends
        /**
         * @var $oauth2 \Webiny\Component\OAuth2\OAuth2
         */
        $oauth2 = unserialize($this->httpSession()->get('oauth'));

        $friendList = $oauth2->request()->rawRequest('https://graph.facebook.com/me/taggable_friends');
        $this->httpSession()->save('friend-list', serialize($friendList['result']['data']));

        View::showView('teamRegisterForm.tpl', [
                'player' => $player
            ], true
        );
    }

    public function friendFinder()
    {
        header('Content-type: application/json');
        $query = $this->httpRequest()->query('q');
        if (strlen($query) < 3) {
            die(json_encode(['friends' => []]));
        }

        $friends = unserialize($this->httpSession()->get('friend-list'));
        $results = [];
        foreach ($friends as &$f) {
            if (preg_match('/' . $query . '/i', $f['name'])) {
                $results[] = [
                    'name'  => $f['name'],
                    'image' => $f['picture']['data']['url']
                ];
            }
        }

        die(json_encode(['friends' => $results]));
    }

    public function registerSubmit()
    {
        $team = $this->_getCurrentTeam();
        $user = $this->_getCurrentPlayer()->toArray();

        $players = explode(';', $this->httpRequest()->post('player-list'));
        $playerArray = [];
        foreach ($players as $p) {
            $p = explode('|', $p);
            if (isset($p[1])) {
                $playerArray[] = ['Name'   => $p[0],
                                  'Avatar' => $p[1]
                ];
            }
        }
        $playerArray[] = ['Name'   => $user['FirstName'] . ' ' . $user['LastName'],
                          'Avatar' => $user['Avatar']
        ];

        $team->FBPlayers = $playerArray;
        $team->Name = $this->httpRequest()->post('name');
        $team->About = $this->httpRequest()->post('about');
        $team->Facebook = $this->httpRequest()->post('facebook');
        $team->Size = $this->httpRequest()->post('size');
        $team->Location = $this->httpRequest()->post('location');
        $team->FreeDay = $this->httpRequest()->post('freeDay');
        $team->FreeTime = $this->httpRequest()->post('freeTime');
        $team->save();

        $this->httpRequest()->redirect($this->router()->generate('SearchPlayer'));
    }

    public function showTeam($id)
    {
        $team = TeamEntity::findById($id)->toArray();
        View::showView('teamDetails.tpl', ['team' => $team], true);
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