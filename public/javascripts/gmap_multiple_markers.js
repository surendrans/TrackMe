$(document).ready(function () {
var markersArray = [];
var pathArray = [];
var marker;
var id_array = [];
var latlng = new google.maps.LatLng(35.245619, 3.515625);
var myOptions = {
	zoom: 6,
	minZoom: 2,
	center: center_latlong,
	mapTypeId: google.maps.MapTypeId.ROADMAP,
	mapTypeControl: true,
	mapTypeControlOptions: {
	  style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
	}
};



var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
var infoWindow = new google.maps.InfoWindow;
//$.each(json, function(i,data){
lat = "13.045929";
lng= "80.197968";
$.each(points, function( intIndex, v ){


var marker = new google.maps.Marker({
          position: new google.maps.LatLng(v.lat, v.lng),
          map: map
        });
                 markersArray.push(marker);
                 pathArray.push(new google.maps.LatLng(v.lat, v.lng))
});
        var markerCluster = new MarkerClusterer(map, markersArray);   
        
        
        
var path = new google.maps.Polyline({
       path: pathArray, strokeColor: '#FF0000'
    });
path.setOptions({ map: map });
        
        
        
        
        
        
        
        
        
        
        
        
});



