<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<link rel="stylesheet" href="/Theme/js/selectize/css/selectize.default.css"/>
<script src="/Theme/js/selectize/js/standalone/selectize.min.js"></script>

<!-- Start Outter Wrapper -->
<div class="outter-wrapper body-wrapper">
    <div class="wrapper ad-pad clearfix">
        <div class="col-3-4">
            <h1>{$player.FirstName}, Register Your Team</h1>

            <p class="lead">Fill in the form to register your team and start searching subs...</p>

        <form id="contactform" class="register-form" action="/team/register/submit" method="post">
            <table class="tableless">

                <!-- Team Name -->
                <tr><td>
                        <label class="subench_form_label">Team Name:</label>
                        <input type="text" id="team_name" name="name">
                    </td></tr>

                <!-- About Team -->
                <tr><td>
                        <label class="subench_form_label">About Team:</label>
                        <textarea id="about_team" name="about"></textarea>
                    </td></tr>

                <!-- Team Facebook -->
                <tr><td>
                        <label class="subench_form_label">Team Facebook Page:</label>
                        <input type="text" id="team_facebook" name="facebook">
                    </td></tr>


                <!-- Team Size -->
                <tr><td>
                        <label class="subench_form_label">Team Size:</label>
                        <select id="team_size" name="size">
                            <option value="none">-</option>
                            <option value="5">5-a-side</option>
                            <option value="6">6-a-side</option>
                            <option value="11">11-a-side</option>
                        </select>
                    </td></tr>

                <!-- Select your players -->
                <tr><td>
                        <label class="subench_form_label">Find your team mates</label>
                        <input type="text" name="players" id="select-friend" class="contacts" placeholder="Search your facebook friends..." />

                        <input type="hidden" id="player-list" name="player-list" value=""/>

                    </td></tr>

                <!-- Location -->
                <tr><td>
                        <label class="subench_form_label" for="location">Where do you usually play?</label>
                        <select id="location" name="location">
                            <option value="none">-</option>
                            <option value="city">City</option>
                            <option value="hackney">Hackney</option>
                            <option value="islington">Islington</option>
                            <option value="newham">Newham</option>
                            <option value="westminster">Westminster</option>
                        </select>
                    </td></tr>

                <!-- Time -->
                <tr><td>

                        <!-- Day -->
                        <label class="subench_form_label" for="freeDay">When do you usually play?</label>
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

                    </td></tr>

            </table>


            <input name="button" class="btn-2" type="submit" value="Register Team" id="send" />
        </form>
    </div>
</div>

<script type="text/javascript">
    $('#select-friend').selectize({
        maxItems: null,
        valueField: 'name',
        labelField: 'name',
        searchField: 'name',
        plugins: ['remove_button'],
        delimiter: ',',
        persist: false,
        create: function(input) {
            return {
                value: input,
                text: input
            }
        },
        options: [],
        render: {
            item: function(item, escape) {
                var cVal = $('#player-list').val();
                $('#player-list').val(item.name+'|'+item.image+';'+cVal);

                return '<div>' +
                (item.name ? '<span class="name">' + escape(item.name) + '</span>' : '') +
                '</div>';
            },
            option: function(item, escape) {
                return '<div>' +
                '<img src="' + escape(item.image) + '" alt="">' +
                '<span class="title">' +
                '<span class="name">' + escape(item.name) + '</span>' +
                '</span>' +
                '</div>';
            }
        },
        load: function(query, callback) {
            if (!query.length) return callback();
            $.ajax({
                url: '/team/register/friend-finder/?q=' + encodeURIComponent(query),
                type: 'GET',
                error: function() {
                    callback();
                },
                success: function(res) {
                    callback(res.friends.slice(0, 10));
                }
            });
        }
    });
</script>