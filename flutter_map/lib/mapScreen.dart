import 'package:flutter/material.dart';
import 'package:flutter_map/direction_model.dart';
import 'package:flutter_map/directions_repositoru.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(37.773972, -122.431297), zoom: 11.5);
  GoogleMapController _googleMapController;
  Marker _origin;
  Marker _destination;
  Directions _info;

  @override
  void dispose() {
    // TODO: implement dispose
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white.withOpacity(0.5),
        title: Text(
          "Google Maps",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          if (_origin != null)
            TextButton(
                onPressed: () => _googleMapController
                        .animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: _origin.position, zoom: 14.5, tilt: 50),
                    )),
                child: Text("Origin", style: TextStyle(color: Colors.black))),
          if (_destination != null)
            TextButton(
                onPressed: () => _googleMapController
                        .animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: _destination.position, zoom: 14.5, tilt: 50),
                    )),
                child:
                    Text("Destination", style: TextStyle(color: Colors.black))),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              if (_origin != null) _origin,
              if (_destination != null) _destination
            },
            polylines: {
              if (_info != null)
                Polyline(
                    polylineId: const PolylineId("overview_polyline"),
                    color: Colors.red,
                    width: 5,
                    points: _info.polylinePoints
                        .map((e) => LatLng(e.latitude, e.longitude))
                        .toList())
            },
            onLongPress: _addMarker,
          ),
          if (_info != null)
            Positioned(
              top: 20.0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.2,
                      )
                    ]),
                child: Text(
                  "${_info.totalDistancel} , ${_info.totalDuration}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => _googleMapController.animateCamera(_info != null
            ? CameraUpdate.newLatLngBounds(_info.bounds, 100)
            : CameraUpdate.newCameraPosition(_initialCameraPosition)),
        child: Icon(Icons.center_focus_strong),
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
          markerId: MarkerId("origin"),
          infoWindow: InfoWindow(title: "Origin"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        _destination = null;

        _info = null;
      });
    } else {
      setState(() {
        _destination = Marker(
          markerId: MarkerId("destination"),
          infoWindow: InfoWindow(title: "Destination"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
          position: pos,
        );
      });

      // Get Directions

      final directions = await DirectionRepository().getDirection(
          origin: _origin.position, destination: _destination.position);
      setState(() {
        print(directions);
        _info = directions;
        // print(_info);
        // print("object");
        // print(_origin.position);
        // print(_destination.position);
      });
    }
  }
}
