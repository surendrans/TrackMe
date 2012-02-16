var latlng = new google.maps.LatLng(LAT, LNG);
var geocoder;
var ZOOMLEVEL;
var address_array = [];
geocoder = new google.maps.Geocoder();
geocoder.geocode( { 'address': ADDR}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
      var len = results[0].address_components.length;
      for(var i=0;i<len;i++)
      {
       address_array.push(results[0].address_components[i].types[0]);
      }
      if ($.inArray("route", address_array) != -1 || $.inArray("neighborhood", address_array) != -1)
      {
       
        ZOOMLEVEL = 16;
        map.setZoom(ZOOMLEVEL);
      }
      else
      {
        ZOOMLEVEL = 7;
        map.setZoom(ZOOMLEVEL);
      }      
     } 
     

});             
var myOptions = {
	zoom: ZOOMLEVEL,
	center: latlng,
	mapTypeId: google.maps.MapTypeId.ROADMAP
};


var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
var marker = new google.maps.Marker({
     position: latlng,
     map: map,
     title: "helloworld"
     
}); 



