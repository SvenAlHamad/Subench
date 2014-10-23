{foreach from=$teams item=team}
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
                {foreach from=$team.FBPlayers item=player}
                    <li class="subs">
                        <img src="{$player.Avatar}" alt="" style="height: 40px" /><br/>
                        {$player.Name}
                    </li>
                {/foreach}
            </ul>
            </p>
        </div>
        <div class="price-cell last">
            <p><a class="btn" href="/team/{$team.id}">View Profile</a></p>
            <p><a class="btn" href="/connect/team/{$team.id}">Join team</a></p>
        </div>
    </div>
</div>
{/foreach}
{if count($teams)<1}
<h2>Sorry, but we don't have any results for your query</h2>
{/if}