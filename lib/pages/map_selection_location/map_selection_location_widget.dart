import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'map_selection_location_model.dart';
export 'map_selection_location_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as lats;
import 'dart:ui' as ui;


class MapSelectionLocationWidget extends StatefulWidget {
  const MapSelectionLocationWidget({super.key});

  @override
  State<MapSelectionLocationWidget> createState() =>
      _MapSelectionLocationWidgetState();
}

class _MapSelectionLocationWidgetState
    extends State<MapSelectionLocationWidget> {
  late MapSelectionLocationModel _model;
  late GoogleMapController mapController;
  late Set<Marker> markers;
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    markers = <Marker>{};
    _model = createModel(context, () => MapSelectionLocationModel());
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _determinePosition().then((value) {
        setState(() {
          mapController.animateCamera(CameraUpdate.newLatLngZoom(
              lats.LatLng(value.latitude, value.longitude), 18));
        });
      });
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Material(
            color: Colors.transparent,
            elevation: 2.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'lq1sj947' /* Select Point From Map */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context, _model.selectedMarker?.toJson());
                      },
                      child: Icon(
                        Icons.save,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              compassEnabled: false,
              mapToolbarEnabled: false,
              myLocationButtonEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              onTap: (location){
                _model.selectedMarker = location;
                markers.clear();
                addPointAsMarker(
                    location.latitude.toString(),
                    location.latitude,
                    location.longitude,
                    "assets/images/artboar.png",
                    FFLocalizations.of(context).getVariableText(
                      enText: 'Your Location',
                      arText: 'موقعك الحالي',
                    ),
                    100);
              },
              markers: markers,
              initialCameraPosition: const CameraPosition(
                target: lats.LatLng(31.987482, 35.884539),
                zoom: 10.4746,
              ),
            ),
          ),
        ],
      ),
    );
  }


  void addPointAsMarker(String id, double lat, double lng, String marker,
      String valueOfUpdatedObject, int value) async {
    await getBitmapDescriptorFromAssetBytes(marker, value).then((icon) {
      setState(() {
        markers.add(Marker(
          markerId: MarkerId(id),
          position: lats.LatLng(lat, lng),
          draggable: false,
          icon: icon,
          infoWindow: InfoWindow(
            title: valueOfUpdatedObject,
          ),
        ));
      });
    });
  }

  Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(
      String path, int width) async {
    final Uint8List? imageData = await getBytesFromAsset(path, width);
    return BitmapDescriptor.fromBytes(imageData!);
  }
  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }
}
