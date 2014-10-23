<!-- Start Outter Wrapper -->
<div class="outter-wrapper body-wrapper">
    <div class="wrapper ad-pad clearfix">


        <div class="main-content col-2-3 right last">
            <h1>{$team.Name}</h1>
            <p class="lead">
                {$team.About}
            </p>
            <hr>
            <h3 id="section1">Team members</h3>
            <div class="clearfix teams">
                {foreach from=$team.FBPlayers item=player}
                <div class="col-1-6 boxy">
                    <img src="{$player.Avatar}" alt="{$player.Name}" style="width: 50px">
                    <em>{$player.Name}</em>
                </div>
                {/foreach}
                <div class="col-1-6 boxy" style="text-align: center">
                    <p class="available">This team is missing a player!</p>
                    <p><a class="btn" href="/connect/team/{$team.id}">Join team</a></p>
                </div>
            </div>
            <hr/>
            <h3>Match details</h3>
            <div class="clearfix evt-single-date">
                <h6 class="left">{$team.Location|ucfirst}</h6>
                <div class="evt-price right">
                    {$team.FreeDay|ucfirst} @
                    {if $team.FreeTime<12}{
                        {$team.FreeTime} am
                    {elseif $team.FreeTime==12}
                        {$team.FreeTime} pm
                    {else}
                        {$team.FreeTime-12} pm
                    {/if}
                </div>
                <br/><br/>
                <iframe
                        src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCrhYVh1uSxik6i4pNz0boAzLFv7CuRXbE&q={$team.Location},London,UK"
                        width="600"
                        height="450"
                        frameborder="0"
                        style="border:0">

                        </iframe>
            </div>
        </div>
        <div class="boxy boxy-pad col-1-3">
            <h5>Team</h5>
            <ul class="widget-list list-2">
                <li><strong>Size:</strong> {$team.Size}-a-side</li>
                <li><strong>Location:</strong> {$team.Location}</li>
                <li><strong>FB:</strong> <a href="{$team.Facebook}">{$team.Facebook}</a></li>
            </ul>
        </div>


    </div>