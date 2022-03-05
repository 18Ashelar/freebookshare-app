import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationOnMap extends StatefulWidget {
  CurrentLocationOnMap({this.latitude, this.longitude});

  final String latitude;
  final String longitude;

  @override
  _CurrentLocationOnMapState createState() => _CurrentLocationOnMapState();
}

class _CurrentLocationOnMapState extends State<CurrentLocationOnMap> {
  GoogleMapController myController;
  String add;
  LatLng _center;

  @override
  void initState() {
    _center =
        LatLng(double.parse(widget.latitude), double.parse(widget.longitude));

    address();

    super.initState();
  }

  address() async {
    final coordinates = new Coordinates(
        double.parse(widget.latitude), double.parse(widget.longitude));
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      add = first.addressLine;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    myController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: GoogleMap(
      mapType: MapType.hybrid,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 10.0,
      ),
      markers: _createMarker(),
    )));
  }

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId("Current Location"),
          position: _center,
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: "User Location",
            snippet: add,
          )),
    ].toSet();
  }
}
