import 'package:google_maps_directions/google_maps_directions.dart';

import '../../backend/api_requests/api_manager.dart';
import '../../backend/schema/structs/student_model_struct.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'map_page_widget.dart' show MapPageWidget;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart' as latsdsd;

class MapPageModel extends FlutterFlowModel<MapPageWidget> {
  ///  Local state fields for this page.

  // List<LatLng> studentsLocationsList = [];
  // void addToStudentsLocationsList(LatLng item) =>
  //     studentsLocationsList.add(item);
  // void removeFromStudentsLocationsList(LatLng item) =>
  //     studentsLocationsList.remove(item);
  // void removeAtIndexFromStudentsLocationsList(int index) =>
  //     studentsLocationsList.removeAt(index);
  // void insertAtIndexInStudentsLocationsList(int index, LatLng item) =>
  //     studentsLocationsList.insert(index, item);
  // void updateStudentsLocationsListAtIndex(
  //         int index, Function(LatLng) updateFn) =>
  //     studentsLocationsList[index] = updateFn(studentsLocationsList[index]);
  ApiCallResponse? apiResultqus;
  bool isLoading = false;
  // bool lockDialog = false;
  List<StudentModelStruct>? students = [];
  ///  State fields for stateful widgets in this page.
  ApiCallResponse? apiResultEndTrip;
  ApiCallResponse? apiResultLiveLocation;

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  latsdsd.LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  Directions? directions;
  DirectionRoute? route;
  List<latsdsd.LatLng>? points;
  List<Polyline>? polylines;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
