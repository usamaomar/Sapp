import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'parent_map_page_widget.dart' show ParentMapPageWidget;
import 'package:flutter/material.dart';

class ParentMapPageModel extends FlutterFlowModel<ParentMapPageWidget> {
  ///  Local state fields for this page.

  List<LatLng> studentsLocationsList = [];
  void addToStudentsLocationsList(LatLng item) =>
      studentsLocationsList.add(item);
  void removeFromStudentsLocationsList(LatLng item) =>
      studentsLocationsList.remove(item);
  void removeAtIndexFromStudentsLocationsList(int index) =>
      studentsLocationsList.removeAt(index);
  void insertAtIndexInStudentsLocationsList(int index, LatLng item) =>
      studentsLocationsList.insert(index, item);
  void updateStudentsLocationsListAtIndex(
          int index, Function(LatLng) updateFn) =>
      studentsLocationsList[index] = updateFn(studentsLocationsList[index]);

  ///  State fields for stateful widgets in this page.

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
