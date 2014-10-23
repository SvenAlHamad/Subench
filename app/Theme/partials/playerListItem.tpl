{foreach from=$players item=player}
    <div class="col-1-3 boxy">
        <div class="mosaic-block circle">
            <a href="/player/{$player.id}" style="display: inline; opacity: 0;"></a>

            <div class="mosaic-backdrop" style="display: block;"><img src="{$player.Avatar}" alt="{$player.FirstName}">
            </div>
        </div>
        <div class="inner-box">
            <h4><a href="/player/{$player.id}">{$player.FirstName} {$player.LastName}</a></h4>
            <h5>{$player.Position|ucfirst}</h5>
            <em>
                <strong>Available:</strong> {$player.FreeDay} @
                {$player.FreeTime} h
            </em>
            <hr/>
            <div style="text-align: center">
                <a class="btn-2" href="/player/{$player.id}">View Profile</a>
                <a class="btn-2" href="/connect/player/{$player.id}">Send Request</a>
            </div>
        </div>
    </div>
{/foreach}
{if count($players)<1}
    <h2>Sorry, but we don't have any results for your query</h2>
{/if}