import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(31.553654, 34.480058),
    zoom: 15,
  );

  Set<Marker> _markers = <Marker>{};
  Set<Circle> _circles = <Circle>{};

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  requestPermission() async {
    PermissionStatus status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      print(" Permission Granted");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "MAP Page",
          style: GoogleFonts.poppins(),
        )),
      ),
      body: GoogleMap(
        initialCameraPosition: cameraPosition,
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
        compassEnabled: true,
        //mapType: MapType.normal,
        onTap: (LatLng latLng) {
          Marker marker = Marker(
            markerId: MarkerId("Marker_${_markers.length}"),
            position: latLng,
            infoWindow: InfoWindow(
              title: "Marker_${_markers.length}",
              snippet: "Marker",
            ),
            onTap: () => print("Marker_${_markers.length}"),
            visible: true,
          );
          setState(
            () => _markers.add(marker),
          );
        },
        onLongPress: (LatLng latLng) {
          Circle circle = Circle(
            circleId: CircleId("Circle_${_circles.length}"),
            visible: true,
            center: latLng,
            radius: 20,
            onTap: () => print("Circle_${_circles.length}"),
            fillColor: Colors.red.shade100,
            strokeWidth: 2,
            strokeColor: Colors.red.shade900,
          );
          setState(
            () => _circles.add(circle),
          );
        },
        markers: _markers,
        circles: _circles,
        /* LOCATION -------------------------------------------------- */
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
      ),
    );
  }
}
