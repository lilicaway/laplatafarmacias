<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Farmacias de Turno en La Plata</title>
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAi4-q1DmSVcduBwMw_uaKWxQmvQLBTONHpUv_O95MKpQZlqEkyxT-Gmb_WP2CWly1Mxb55MNHl4SW0g" type="text/javascript"></script>
  </head>
  <body onunload="GUnload()">

	<h2>Farmacias de Turno en La Plata</h2>
	<h3>Under Construction</h3>
	<h3>This page was adapted from <a href="http://econym.org.uk/gmap/example_map3.htm">here</a></h3>

	<p><strong>Project home:</strong> <a href="http://code.google.com/p/laplatafarmacias/">http://code.google.com/p/laplatafarmacias/</a></p>
    <!-- you can use tables or divs for the overall layout -->

    <table border="1">
      <tr>
        <td>
           <div id="map" style="width: 650px; height: 550px"></div>
        </td>
        <td width="150" valign="top" style="text-decoration: underline; color: #4444ff;">
           <div id="side_bar"></div>
        </td>
      </tr>

    </table>

    <noscript><b>JavaScript must be enabled in order for you to use Google Maps.</b> 
      However, it seems JavaScript is either disabled or not supported by your browser. 
      To view Google Maps, enable JavaScript by changing your browser options, and then 
      try again.
    </noscript>


    <script type="text/javascript">
    //<![CDATA[

	function describimelo(nombreVar, variable) {
		var desc = nombreVar+ ":\n";
		for( j in variable) {
			desc += (j+"=" + variable[j]+ "\n");
		}
		alert(desc);
	}
	
       if (GBrowserIsCompatible()) {
      // this variable will collect the html which will eventualkly be placed in the side_bar
      var side_bar_html = "<ul>";
    
      // arrays to hold copies of the markers used by the side_bar
      // because the function closure trick doesnt work there
      var gmarkers = [];

      // A function to create the marker and set up the event window
      function createMarker(point,name,html) {
        var marker = new GMarker(point);
        GEvent.addListener(marker, "click", function() {
          marker.openInfoWindowHtml(html);
        });
        // save the info we need to use later for the side_bar
        gmarkers.push(marker);
        // add a line to the side_bar html
        side_bar_html += '<li><a href="javascript:myclick(' + (gmarkers.length-1) + ')">' + name + '<\/a></li>';
        return marker;
      }


      // This function picks up the click and opens the corresponding info window
      function myclick(i) {
        GEvent.trigger(gmarkers[i], "click");
      }


      // create the map
      var map = new GMap2(document.getElementById("map"));
      map.addControl(new GLargeMapControl());
      map.addControl(new GMapTypeControl());
      map.setCenter(new GLatLng( -34.9095 , -57.9993 ), 12);


      // Read the data from example.xml
      GDownloadUrl("laplatafarmacias/getPharmaciesOnDuty", function(doc) {
        var xmlDoc = GXml.parse(doc);
        var items = xmlDoc.documentElement.getElementsByTagName("item");
        //alert('elementos'+items.length);  
        for (var i = 0; i < items.length; i++) {
          // obtain the attribues of each item
		  //alert('i: '+i);
		  //describimelo("items["+i+"]", items[i]);
		  var latText = "";
		  var lngText = "";
		  var title = "";
		  var description = "";
		  var elements = items[i].childNodes;
		  for (var j = 0;j < elements.length; j++ ) {
			  if (elements.item(j).nodeName == "geo:lat") {
				  latText = elements.item(j).textContent == null ? elements.item(j).text : elements.item(j).textContent;
			  } else if (elements.item(j).nodeName == "geo:long") {
				  lngText = elements.item(j).textContent == null ? elements.item(j).text : elements.item(j).textContent;
			  } else if (elements.item(j).nodeName == "title") {
				  title = elements.item(j).textContent == null ? elements.item(j).text : elements.item(j).textContent;
			  } else if (elements.item(j).nodeName == "description") {
				  description = elements.item(j).textContent == null ? elements.item(j).text : elements.item(j).textContent;
			  }
		  }
          var lat = parseFloat(latText);
          var lng = parseFloat(lngText);
          var point = new GLatLng(lat,lng);
          var html = "<strong>"+title+"</strong>" + (description ? description : "");
          var item = createMarker(point,title,html);
          map.addOverlay(item);
        }
        side_bar_html += "</ul>";
        // put the assembled side_bar_html contents into the side_bar div
        document.getElementById("side_bar").innerHTML = side_bar_html;
      });
    }

    else {
      alert("Sorry, the Google Maps API is not compatible with this browser");
    }

    // This Javascript is based on code provided by the
    // Community Church Javascript Team
    // http://www.bisphamchurch.org.uk/   
    // http://econym.org.uk/gmap/

    //]]>
    </script>
  </body>

</html>




