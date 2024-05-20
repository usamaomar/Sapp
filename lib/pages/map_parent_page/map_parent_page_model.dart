import '../../backend/api_requests/api_manager.dart';
import '../../backend/schema/structs/student_model_struct.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'map_parent_page_widget.dart' show MapParentPageWidget;
import 'package:flutter/material.dart';

class MapParentPageModel extends FlutterFlowModel<MapParentPageWidget> {
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
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
