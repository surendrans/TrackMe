var lati, lngi, LAT, LNG;
var latitude;
var longitude; 
var markerArray = [];
var geocoder;
if (LAT && LNG != null)
 {
  lati = LAT;
  lngi = LNG;
 } 
else
 {
  lati = 35.245619;
  lngi = 3.515625;
 }
var latlng = new google.maps.LatLng(lati, lngi);
	
var myOptions = {
	zoom: 2,
	minZoom:2,
	center: latlng,
	mapTypeId: google.maps.MapTypeId.ROADMAP
};

var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
if(LAT && LNG != null)
{
   var marker = new google.maps.Marker({
     position: latlng,
     map: map
   });
   markerArray.push(marker);
   google.maps.event.addListener(marker, 'position_changed', function (event) {
      deleteMarkers();
      saveMarker(this);
   });  
}

google.maps.event.addListenerOnce(map, "resize", function() { });
google.maps.event.addListener(map, 'click', function(event) {
	if (markerArray.length == 1)
	{
		markerArray[0].setPosition(event.latLng);
	}
	else
	{
		placeMarker(event.latLng);
	}

});  
function placeMarker(location) {
	deleteMarkers();
	var marker = new google.maps.Marker({
		position: location,
		map: map,
		animation: google.maps.Animation.DROP,
		//draggable: true
	});
	markerArray.push(marker);
	saveMarker(marker);
	//Resolve OVER_QUERY_LIMIT
	/*google.maps.event.addListener(marker, 'dragend', function (event) {
		saveMarker(this);

	});*/  
	google.maps.event.addListener(marker, 'position_changed', function (event) {
		saveMarker(this);

	});  
	
}

var input = document.getElementById('searchTextField');
var autocomplete = new google.maps.places.Autocomplete(input);
autocomplete.bindTo('bounds', map);
var infowindow = new google.maps.InfoWindow();
google.maps.event.addListener(autocomplete, 'place_changed', function() {
	var place = autocomplete.getPlace();
	if (place.geometry.viewport) {
          placeMarker(place.geometry.location);
          map.fitBounds(place.geometry.viewport);
		map.setCenter(place.geometry.location);
		map.setZoom(16); 
	} 
	else {
	     saveMarker(place.geometry.location);
		placeMarker(place.geometry.location);
		map.setCenter(place.geometry.location);
		map.setZoom(8);  
	}
}); 


function deleteMarkers() {
	if (markerArray) {
		for (i in markerArray) {
			markerArray[i].setMap(null);
		}
		markerArray.length = 0;
	}
}

function saveMarker(MarkerObject)
{
	latitude = MarkerObject.getPosition().lat();
	longitude = MarkerObject.getPosition().lng();
	$("input[id = issue_latitude]").val(latitude);
	$("input[id = issue_longitude]").val(longitude);
	$("input[id = issue_geotagged]").val(true);
	alert_geo_tag_details(latitude, longitude);
}

function alert_geo_tag_details(latitude, longitude) {
	$('#geo_tag_info').slideUp();
	$('#geo_tag_info').slideDown('slow');
	$('#lat_text').html(latitude);
	$('#long_text').html(longitude);
	show_reverse_geocoder(latitude, longitude);	
}

function show_reverse_geocoder(latitude, longitude){
	geocoder = new google.maps.Geocoder();
	geocoder.geocode({'latLng': new google.maps.LatLng(latitude, longitude)}, show_place);
}

function show_place(response, status){
	if (status == google.maps.GeocoderStatus.OK) {
          $("input[id = issue_almost_location]").val(response[0].formatted_address);
	     $("#near_by_location").html(response[0].formatted_address);
	}
	else {
		alert("Geocoder failed due to: " + status);
	}

}



