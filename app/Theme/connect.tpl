<!-- Start Outter Wrapper -->
<div class="outter-wrapper body-wrapper">
    <div class="wrapper ad-pad clearfix">


        <div class="seperator">
            <h3>{$msg}</h3>
            <hr/>

            <div id="team-list">
                <div class="price-table">
                    <div class="price-row">
                        <div class="price-cell">
                            <p>
                                {$team.Name}
                                <span>{$team.Size}-a-side</span>
                                <span>{$team.Location|ucfirst}</span>
                <span>{$team.FreeDay|ucfirst} /
                    {$team.FreeTime} h
                </span>
                            </p>
                        </div>
                        <div class="price-cell">
                            <h3>Members</h3>
                            <p>
                            <ul>
                                {foreach from=$team.FBPlayers item=player name=pLoop}
                                    <li class="subs {if $smarty.foreach.pLoop.last}chosen{/if}">
                                        {if $smarty.foreach.pLoop.last}
                                            You're in
                                            <br/>
                                        {/if}
                                        <img src="{$player.Avatar}" alt="" style="height: 40px" /><br/>
                                        {$player.Name}
                                    </li>
                                {/foreach}
                            </ul>
                            </p>
                        </div>
                        <div class="price-cell last">
                            <p><a class="btn" href="/team/{$team.id}">View Profile</a></p>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>