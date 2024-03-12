import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(20.28828828828829, 85.75253410478031),
    zoom: 14.4746,
  );

  void describeUser() {}
  double lat = 0.0, long = 0.0;
  void getUserLocation() async {
    GeolocatorPlatform platform = GeolocatorPlatform.instance;
    LocationPermission permission = await platform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await platform.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return;
      }
    }
    Position position = await platform.getCurrentPosition();
    lat = position.latitude;
    long = position.longitude;
    print('$lat , $long');

    setState(() {});
  }

  var markers = <Marker>{
    const Marker(markerId: MarkerId('user1'), position: LatLng(20.2, 85.8)),
    const Marker(
        markerId: MarkerId('user111'),
        position: LatLng(20.28828828828829, 85.75253410478031)),
    const Marker(markerId: MarkerId('user2'), position: LatLng(20.3, 85.7)),
    const Marker(markerId: MarkerId('user3'), position: LatLng(20.4, 85.75)),
    const Marker(markerId: MarkerId('user4'), position: LatLng(20.5, 85.6)),
    const Marker(markerId: MarkerId('user5'), position: LatLng(20.6, 85.55)),
    const Marker(markerId: MarkerId('user6'), position: LatLng(20.7, 85.65)),
    const Marker(markerId: MarkerId('user7'), position: LatLng(20.8, 85.5)),
    const Marker(markerId: MarkerId('user8'), position: LatLng(20.9, 85.45)),
    const Marker(markerId: MarkerId('user9'), position: LatLng(21.0, 85.55)),
    const Marker(markerId: MarkerId('user10'), position: LatLng(21.1, 85.4)),
    const Marker(markerId: MarkerId('user11'), position: LatLng(21.2, 85.35)),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: markers,
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: getUserLocation,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }
}
