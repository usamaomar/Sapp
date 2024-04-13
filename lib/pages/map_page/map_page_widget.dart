import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import '../../backend/api_requests/api_calls.dart';
import '../../backend/schema/structs/parent_model_struct.dart';
import '../../dialogs/arrive_or_didnt/arrive_or_didnt_widget.dart';
import '../../flutter_flow/geo_utils.dart';
import '/dialogs/go_or_back/go_or_back_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'map_page_model.dart';
export 'map_page_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as lats;
import 'dart:ui' as ui;

class MapPageWidget extends StatefulWidget {
  const MapPageWidget({super.key});

  @override
  State<MapPageWidget> createState() => _MapPageWidgetState();
}

class _MapPageWidgetState extends State<MapPageWidget> {
  late MapPageModel _model;
  LatLng? currentLocation;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late LocationSettings locationSettings;
  late StreamSubscription<Position> positionStream;
  late GoogleMapController mapController;
  late Set<Marker> markers;
  Position? position;

  @override
  void initState() {
    markers = <Marker>{};
    super.initState();
    _model = createModel(context, () => MapPageModel());
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().fullParentStateList.map((data) {
          addPointAsMarker(
              data.id.toString(),
              double.parse(data.lat),
              double.parse(data.lng),
              "assets/images/artboar.png",
              "${data.name}",
              100);
        }).toList();
      });
      await _determinePosition().then((value) {
        setState(() {
          mapController.animateCamera(CameraUpdate.newLatLngZoom(
              lats.LatLng(value.latitude, value.longitude), 18));
        });
        addPointAsMarker('assets/images/bus_5.png', value.latitude,
            value.longitude, "assets/images/bus_5.png", FFAppState().UserModelState.name, 100);
      });
      if (FFAppState().fullParentStateList.isNotEmpty) {
        // positionStream.resume();
        getLocationApi();
      }
    });
  }

  void getLocationApi() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
          accuracy: LocationAccuracy.best,
          distanceFilter: 1,
          forceLocationManager: true,
          intervalDuration: const Duration(seconds: 0),
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText: "Bus Location Is collected",
            notificationTitle: "Trackllo",
            enableWakeLock: true,
          ));
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.best,
        activityType: ActivityType.fitness,
        distanceFilter: 1,
        pauseLocationUpdatesAutomatically: true,
        showBackgroundLocationIndicator: false,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 1,
      );
    }
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      setState(() {
        this.position = position;
        markers.clear();
        FFAppState().fullParentStateList.map((data) {
          addPointAsMarker(
              data.id.toString(),
              double.parse(data.lat),
              double.parse(data.lng),
              "assets/images/artboar.png",
              "${data.name}",
              100);
        }).toList();
        addPointAsMarker('assets/images/bus_5.png', position?.latitude ?? 0.0,
            position?.longitude ?? 0.0, "assets/images/bus_5.png", FFAppState().UserModelState.name, 100);
      });

      FFAppState().fullParentStateList.map((data) async{
        bool withinRadius = GeoUtils.isWithinRadius(
            position?.latitude ?? 0.0,
            position?.longitude ?? 0.0,
            double.parse(data.lat),
            double.parse(data.lng),
            500);
        if (withinRadius) {
          if(!_model.lockDialog){
            _model.lockDialog = true;
            await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment:
                const AlignmentDirectional(0.0, 0.0)
                    .resolve(
                    Directionality.of(context)),
                child: GestureDetector(
                  onTap: () => _model
                      .unfocusNode.canRequestFocus
                      ? FocusScope.of(context)
                      .requestFocus(
                      _model.unfocusNode)
                      : FocusScope.of(context)
                      .unfocus(),
                  child:   ArriveOrDidntWidget(parentModelStruct: data,),
                ),
              );
            },
            ).then((value) => setState(() {
              _model.lockDialog = false;
            }));
          }
          print('inside');
        } else {
          print('out');
        }
      }).toList();
    });
  }

  @override
  void dispose() {
    _model.dispose();
    positionStream.pause();
    positionStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 30.0, 10.0, 10.0),
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    FFAppState().UserModelState.profilePhotoPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFAppState().UserModelState.name,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.goNamed('LogInScreen');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'oe5kkwclc' /* LogOut */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  scaffoldKey.currentState!.openDrawer();
                },
                child: Icon(
                  Icons.list_outlined,
                  color: FlutterFlowTheme.of(context).alternate,
                  size: 35.0,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Text(
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
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              GoogleMap(
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                compassEnabled: false,
                mapToolbarEnabled: false,
                myLocationButtonEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
                markers: markers,
                initialCameraPosition: const CameraPosition(
                  target: lats.LatLng(31.987482, 35.884539),
                  zoom: 10.4746,
                ),
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
                          checkPermition().catchError((onError) async {
                            if (onError.toString().isEmpty) {
                              _determinePosition().then((value) async {
                                setState(() {
                                  _model.googleMapsCenter =
                                      LatLng(value.latitude, value.longitude);
                                });
                                if (FFAppState()
                                    .fullParentStateList
                                    .isNotEmpty) {
                                  setState(() {
                                    _model.isLoading = true;
                                  });
                                  _model.apiResultEndTrip = await StrackerApisGroup.endTripApiCall
                                      .call(authorization: FFAppState().TokenModelState.token);
                                  if ((_model.apiResultEndTrip?.succeeded ?? true)) {
                                    setState(() {
                                      _model.isLoading = false;
                                    });
                                    setState(() {
                                      FFAppState().fullParentStateList.clear();
                                      markers.clear();
                                    });
                                    positionStream.pause();
                                    positionStream.cancel();
                                    addPointAsMarker(
                                        'assets/images/bus_5.png',
                                        position?.latitude ?? 0.0,
                                        position?.longitude ?? 0.0,
                                        "assets/images/bus_5.png",
                                        FFAppState().UserModelState.name,
                                        100);
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
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: GoOrBackWidget(
                                            actionGo: () async {
                                              actionGO();
                                            },
                                            actionBack: () async {

                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {
                                        positionStream.resume();
                                      }));
                                }
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    FFLocalizations.of(context).getVariableText(
                                      enText: onError,
                                      arText: onError,
                                    ),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            }
                          });
                        },
                        text: FFAppState().fullParentStateList.isNotEmpty
                            ? FFLocalizations.of(context).getText(
                                'ct87vsqrs' /* Stop */,
                              )
                            : FFLocalizations.of(context).getText(
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
                  child: const Align(
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

  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(
      String path, int width) async {
    final Uint8List? imageData = await getBytesFromAsset(path, width);
    return BitmapDescriptor.fromBytes(imageData!);
  }

  void actionGO() async {
    setState(() {
      _model.isLoading = true;
    });
    _model.apiResultqus = await StrackerApisGroup.getStudentApiCall
        .call(authorization: FFAppState().TokenModelState.token,goBack: 'go');
    if ((_model.apiResultqus?.succeeded ?? true)) {
      setState(() {
        _model.isLoading = false;
      });
      setState(() {
        FFAppState().fullParentStateList = (getJsonField(
          (_model.apiResultqus?.jsonBody ?? ''),
          r'''$''',
          true,
        )!
                .toList()
                .map<ParentModelStruct?>(ParentModelStruct.maybeFromMap)
                .toList() as Iterable<ParentModelStruct?>)
            .withoutNulls
            .toList()
            .cast<ParentModelStruct>();
      });
      getLocationApi();
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

  Future checkPermition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('تم تعطيل تحديد خدمات الموقع.');
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
        return Future.error('تم رفض تحديد الموقع');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('تم رفض تحديد الموقع بشكل دائم، ولا يمكننا طلب اذن.');
    }

    return Future.error('');
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
}
