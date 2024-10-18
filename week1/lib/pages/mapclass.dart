import "dart:async";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      // bearing: 192.8334901395799,
      target: LatLng(27.70415, 85.30647),
      // tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  var _maptheme;

  Future _loadMapTheme() async {
    _maptheme = await rootBundle.loadString('raw/maptheme.json');
  }

  @override
  void initState() {
    super.initState();
    _loadMapTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        style: _maptheme,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);

          // controller.(_maptheme);
        },
        markers: {
          Marker(
            markerId: MarkerId("Bookverse"),
            position: LatLng(27.6734, 85.3250),
            infoWindow: InfoWindow(title: "Bookverse"),
            onTap: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(27.6992, 85.3127), 18),
              );
            },
          ),
        },
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label: const Text('To Kathmandu'),
          icon: const Icon(Icons.home),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
