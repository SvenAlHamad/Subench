<?php

namespace Subench\Pages;

use Subench\Entities\PlayerEntity;
use Subench\Lib\View;
use Webiny\Component\EventManager\EventManagerTrait;
use Webiny\Component\Http\HttpTrait;
use Webiny\Component\OAuth2\OAuth2User;
use Webiny\Component\Router\RouterTrait;
use Webiny\Component\Security\Security;

class Player
{
    use HttpTrait, EventManagerTrait, RouterTrait;

    public function login()
    {
        if ($this->httpRequest()->query('error')) {
            // redirect him to homepage
            $this->httpRequest()->redirect($this->router()->generate('Homepage'));
        }

        $this->httpSession()->delete('user');
        $this->eventManager()->listen('wf.security.user.oauth2')->handler($this)->method('facebookRegisterCallback');
        Security::getInstance()->firewall('Admin')->processLogout();
        $result = Security::getInstance()->firewall('Admin')->getUser()->isAuthenticated();

        if (!$result) {
            $result = Security::getInstance()->firewall('Admin')->processLogin('FacebookPlayer');
        }

        if ($this->httpSession()->get('user')) {
            $user = unserialize($this->httpSession()->get('user'));
            $player = new PlayerEntity();
            $player->FirstName = $user->getFirstName();
            $player->LastName = $user->getLastName();
            $player->Email = $user->email;
            $player->Avatar = $user->getAvatarUrl();
            $player->Facebook = 'https://www.facebook.com/' . $user->profileId;
            $player->save();

            // redirect to create account
            $this->httpRequest()->redirect($this->router()->generate('RegisterPlayerForm'));
        } else {
            // redirect to listing
            $this->httpRequest()->redirect($this->router()->generate('SearchTeam'));
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
            $this->httpSession()->save('user', serialize($user));
        }
    }

    public function registerForm()
    {
        $player = $this->_getCurrentPlayer();
        View::showView('playerRegisterForm.tpl', ['player' => $player], true);
    }

    public function registerSubmit()
    {
        $player = $this->_getCurrentPlayer();
        $player->Position = $this->httpRequest()->post('position');
        $player->Location = $this->httpRequest()->post('location');
        $player->FreeDay = $this->httpRequest()->post('freeDay');
        $player->FreeTime = $this->httpRequest()->post('freeTime');
        $player->About = $this->httpRequest()->post('about');
        $player->save();

        $this->httpRequest()->redirect($this->router()->generate('SearchTeam'));
    }

    public function showPlayer($id)
    {
        $player = PlayerEntity::findById($id);
        View::showView('playerDetails.tpl', ['player'=>$player], true);
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
}