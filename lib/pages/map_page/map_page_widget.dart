import '../../backend/api_requests/api_calls.dart';
import '/dialogs/go_or_back/go_or_back_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'map_page_model.dart';
export 'map_page_model.dart';

class MapPageWidget extends StatefulWidget {
  const MapPageWidget({super.key});

  @override
  State<MapPageWidget> createState() => _MapPageWidgetState();
}

class _MapPageWidgetState extends State<MapPageWidget> {
  late MapPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              '8ejc2hr8' /* Map */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              FlutterFlowGoogleMap(
                controller: _model.googleMapsController,
                onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                initialLocation: _model.googleMapsCenter ??=
                    const LatLng(13.106061, -59.613158),
                markers: _model.studentsLocationsList
                    .map(
                      (marker) => FlutterFlowMarker(
                        marker.serialize(),
                        marker,
                      ),
                    )
                    .toList(),
                markerColor: GoogleMarkerColor.violet,
                mapType: MapType.normal,
                style: GoogleMapStyle.standard,
                initialZoom: 14.0,
                allowInteraction: true,
                allowZoom: true,
                showZoomControls: false,
                showLocation: true,
                showCompass: false,
                showMapToolbar: false,
                showTraffic: false,
                centerMapOnMarkerTap: true,
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: PointerInterceptor(
                  intercepting: isWeb,
                  child: Builder(
                    builder: (context) => Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 20.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: GoOrBackWidget(
                                    actionGo: () async {
                                      actionGO();
                                    },
                                    actionBack: () async {},
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        text: FFLocalizations.of(context).getText(
                          'ct87vsqr' /* Start */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).error,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: _model.isLoading,
                child: Container(
                  color: Colors.black26,
                  width: double.infinity,
                  height: double.infinity,
                  child: Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: Colors.amberAccent,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void actionGO() async {
    setState(() {
      _model.isLoading = true;
    });
    _model.apiResultqus = await StrackerApisGroup.getStudentApiCall
        .call(authorization: FFAppState().TokenModelState.token);
    if ((_model.apiResultqus?.succeeded ?? true)) {
      setState(() {
        _model.isLoading = false;
      });
      // setState(() {
      //   FFAppState().UserModelState =
      //   UserModelStruct.maybeFromMap(
      //       getJsonField(
      //         (_model.apiResultqus?.jsonBody ??
      //             ''),
      //         r'''$.user''',
      //       ))!;
      // });
      // setState(() {
      //   FFAppState().TokenModelState =
      //   TokenModelStruct.maybeFromMap(
      //       getJsonField(
      //         (_model.apiResultqus?.jsonBody ??
      //             ''),
      //         r'''$''',
      //       ))!;
      // });
    } else {
      setState(() {
        _model.isLoading = false;
      });
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text(FFLocalizations.of(context).getVariableText(
              enText: 'Error',
              arText: 'خطا',
            )),
            content: Text(getJsonField(
              (_model.apiResultqus?.jsonBody ?? ''),
              r'''$.message''',
            ).toString()),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text(FFLocalizations.of(context).getVariableText(
                  enText: 'Ok',
                  arText: 'حسنا',
                )),
              ),
            ],
          );
        },
      );
    }
  }
}
