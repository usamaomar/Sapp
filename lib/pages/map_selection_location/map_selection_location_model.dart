import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'map_selection_location_widget.dart' show MapSelectionLocationWidget;
import 'package:flutter/material.dart';

class MapSelectionLocationModel
    extends FlutterFlowModel<MapSelectionLocationWidget> {
  ///  Local state fields for this component.

  LatLng? selectedMarker;

  ///  State fields for stateful widgets in this component.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
