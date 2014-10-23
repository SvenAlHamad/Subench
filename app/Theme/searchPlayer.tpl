<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- Start Outter Wrapper -->
<div class="outter-wrapper body-wrapper">
    <div class="wrapper ad-pad clearfix">


        <div class="col-3-4">
            <h1>Search For Subs</h1>
            <p class="lead">Filter player options to find the right sub for your match...</p>

            <div>
                <h3>Player Filter:</h3>
                <!-- Start Form -->
                <form class="subench_form register-form" id="filterForm">
                    <table class="tableless">

                        <!-- Team Size -->
                        <tr><td>
                                <label class="subench_form_label">When do you need the player?</label>
                                <select id="day" name="day">
                                    <option value="">-</option>
                                    <option value="monday">Monday</option>
                                    <option value="tuesday">Tuesday</option>
                                    <option value="wednesday">Wednesday</option>
                                    <option value="thursday">Thursday</option>
                                    <option value="friday">Friday</option>
                                    <option value="saturday">Saturday</option>
                                    <option value="sunday">Sunday</option>
                                </select>

                                <label class="subench_form_label auto-width">@</label>
                                <select class="form-control" name="freeTime">
                                    <option value="6">6am</option>
                                    <option value="7">7am</option>
                                    <option value="8">8am</option>
                                    <option value="9">9am</option>
                                    <option value="10">10am</option>
                                    <option value="11">11am</option>
                                    <option value="12">12pm</option>
                                    <option value="13">1pm</option>
                                    <option value="14">2pm</option>
                                    <option value="15">3pm</option>
                                    <option value="16">4pm</option>
                                    <option value="17">5pm</option>
                                    <option value="18">6pm</option>
                                    <option value="19">7pm</option>
                                    <option value="20" selected="selected">8pm</option>
                                    <option value="21">9pm</option>
                                    <option value="22">10pm</option>
                                    <option value="23">11pm</option>
                                    <option value="24">13pm</option>
                                </select>
                            </td></tr>

                        <!-- Team Location -->
                        <tr><td>
                                <label class="subench_form_label">Where are you playing?</label>
                                <select id="location" name="location">
                                    <option value="">-</option>
                                    <option value="city">City</option>
                                    <option value="hackney">Hackney</option>
                                    <option value="islington">Islington</option>
                                    <option value="newham">Newham</option>
                                    <option value="westminster">Westminster</option>
                                </select>

                            </td></tr>

                        <!-- Position + Location -->
                        <tr><td>
                                <label class="subench_form_label" for="position">Preferred Position:</label>
                                <select id="position" name="position">
                                    <option value="">-</option>
                                    <option value="anywhere">Anywhere</option>
                                    <option value="goalkeeper">Goal Keeper</option>
                                    <option value="attack">Attack</option>
                                    <option value="defense">Defence</option>
                                </select>

                            </td></tr>

                    </table>
                </form>
            </div>

            <div class="seperator">
                <h3>Matched Players:</h3>
                <hr/>
                <div class="clearfix teams" id="player-list">

                    {include file="./partials/playerListItem.tpl" players=$results}

                </div>
            </div>

        </div>
    </div>

   <script type="text/javascript">
       function refreshResult()
       {
           $.ajax({
               url: '/search/player/refresh/',
               data: $('#filterForm').serialize(),
               type: 'GET',
               success: function(res) {
                   $('#player-list').html(res);
               }
           });
       }
       $('#filterForm').change(function(){
           console.log('refreshing');
           refreshResult();
       });
   </script>