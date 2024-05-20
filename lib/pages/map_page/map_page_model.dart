import '/dialogs/go_or_back/go_or_back_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'map_page_widget.dart' show MapPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';

class MapPageModel extends FlutterFlowModel<MapPageWidget> {
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
