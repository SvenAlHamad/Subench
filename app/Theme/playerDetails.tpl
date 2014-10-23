<!-- Start Outter Wrapper -->
<div class="outter-wrapper body-wrapper">
    <div class="wrapper ad-pad clearfix">


        <div class="main-content col-3-4 right last">
            <h1>{$player.FirstName} {$player.LastName}</h1>
            <p class="lead">
                {$player.About}
            </p>
            <div class="col-1-6 boxy" style="text-align: center">
                <p class="available">This player is looking for a team!</p>
                <a class="btn-2" href="/connect/player/{$player.id}">Send Request</a>
            </div>
            <hr>
            <h3>Availability</h3>
            <div class="clearfix evt-single-date">
                <h6 class="left">{$player.Location|ucfirst}</h6>
                <div class="evt-price right">
                    {$player.FreeDay|ucfirst} @

                        {$player.FreeTime} pm

                </div>
                <br/><br/>
                <iframe
                        src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCrhYVh1uSxik6i4pNz0boAzLFv7CuRXbE&q={$player.Location},London,UK"
                        width="600"
                        height="450"
                        frameborder="0"
                        style="border:0">

                </iframe>
            </div>
        </div>

        <div class="boxy boxy-pad col-1-4">
            <br/>
            <center>
                <img src="{$player.Avatar}" alt=""/><br/>
                <br/>
                <a href="{$player.Facebook}">View Facebook Page</a>
            </center>

            <br/>

        </div>
    </div>
</div>