// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


function findMe() {
    if(navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            document.getElementById('checkin_latitude').value = position.coords.latitude;
            document.getElementById('checkin_longitude').value = position.coords.longitude;
        }, function() {
            alert('We couldn\'t find your position.');
        });
    } else {
        alert('Your browser doesn\'t support geolocation.');
    }
}

function updateCheckin() {
    if(navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var latitude = position.coords.latitude.toFixed(3);
            var longitude = position.coords.longitude.toFixed(3);
            if ($.cookie('checkin_latitude') != latitude || $.cookie('checkin_longitude') != longitude) {
                $.cookie('checkin_latitude', latitude);
                $.cookie('checkin_longitude', longitude);
                $.post("/cars/2/checkins",  { checkin: {"title": "Honda", "latitude": latitude, "longitude": longitude}},
                    /* The callback that will get executed once the data is back from the server*/
                    function (dataFromTheBackEnd) {
//                        $(".debug-display").html(dataFromTheBackEnd);
                    });
            }
        }, function() {
            alert('We couldn\'t find your position.');
        });
    } else {
        alert('Your browser doesn\'t support geolocation.');
    }
}
