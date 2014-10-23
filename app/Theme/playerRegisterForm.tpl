<!-- Start Outter Wrapper -->
<div class="outter-wrapper body-wrapper">
    <div class="wrapper ad-pad clearfix">
        <div class="col-3-4">
            <h1>About Yourself {$player.FirstName}</h1>

            <p class="lead">Fill in the form to register as a player and be added to our database of subs...</p>


        <form id="contactform" class="register-form" action="/player/register/submit" method="post">
            <table class="tableless">

                <!-- Position -->
                <tr>
                    <td>
                        <label class="subench_form_label" for="position">Preferred Position:</label>
                        <select id="position" name="position">
                            <option value="none">-</option>
                            <option value="anywhere">Anywhere</option>
                            <option value="goalkeeper">Goal Keeper</option>
                            <option value="attack">Attack</option>
                            <option value="defense">Defence</option>
                        </select>
                    </td>
                </tr>

                <!-- Location -->
                <tr>
                    <td>
                        <label class="subench_form_label" for="location">Location:</label>
                        <select id="location" name="location">
                            <option value="none">-</option>
                            <option value="city">City</option>
                            <option value="hackney">Hackney</option>
                            <option value="islington">Islington</option>
                            <option value="newham">Newham</option>
                            <option value="westminster">Westminster</option>
                        </select>
                    </td>
                </tr>

                <!-- Time -->
                <tr>
                    <td>

                        <!-- Day -->
                        <label class="subench_form_label" for="day">When are you free?</label>
                        <select id="day" name="freeDay">
                            <option value="none">-</option>
                            <option value="monday">Monday</option>
                            <option value="tuesday">Tuesday</option>
                            <option value="wednesday">Wednesday</option>
                            <option value="thursday">Thursday</option>
                            <option value="friday">Friday</option>
                            <option value="saturday">Saturday</option>
                            <option value="sunday">Sunday</option>
                        </select>

                        <!-- Start time -->
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
                            <option value="20">8pm</option>
                            <option value="21">9pm</option>
                            <option value="22">10pm</option>
                            <option value="23">11pm</option>
                            <option value="24">13pm</option>
                        </select>
                    </td>
                </tr>


                <tr>
                    <td><label class="subench_form_label" for="startTime">About:</label>
                        <textarea id="message" name="about" rows="5" cols="20"
                                  placeholder="Tell us about yourself!"></textarea></td>
                </tr>
            </table>


            <input name="button" class="btn-2" type="submit" value="Register" id="send"/>
        </form>
    </div>
</div>