import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import '../../backend/api_requests/api_calls.dart';
import '../../backend/schema/structs/parent_model_struct.dart';
import '../../dialogs/arrive_or_didnt/arrive_or_didnt_away_widget.dart';
import '../../dialogs/arrive_or_didnt_away/arrive_or_didnt_widget.dart';
import '../../flutter_flow/geo_utils.dart';
import '/dialogs/go_or_back/go_or_back_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'map_parent_page_model.dart';
export 'map_parent_page_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as lats;
import 'dart:ui' as ui;

class MapParentPageWidget extends StatefulWidget {
  const MapParentPageWidget({super.key});

  @override
  State<MapParentPageWidget> createState() => _MapPageWidgetState();
}

class _MapPageWidgetState extends State<MapParentPageWidget> {
  late MapParentPageModel _model;
  LatLng? currentLocation;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late LocationSettings locationSettings;
  late StreamSubscription<Position> positionStream;
  late GoogleMapController mapController;
  late Set<Marker> markers;
  Position? position;

  // LatLng? currentLatLng;

  @override
  void initState() {
    markers = <Marker>{};
    super.initState();
    _model = createModel(context, () => MapParentPageModel());
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
        addPointAsMarker(
            'assets/images/bus_5.png',
            value.latitude,
            value.longitude,
            "assets/images/bus_5.png",
            FFAppState().UserModelState.name,
            100);
      });
      if (FFAppState().isLiveLocationStarted) {
        getLocationApi();
      }
    });
    FirebaseMessaging.instance.getToken().then((fbToken) {
      FFAppState().FCM = fbToken ?? 'null';
    });
  }

  void getLocationApi() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
          accuracy: LocationAccuracy.bestForNavigation,
          distanceFilter: 1,
          forceLocationManager: true,
          intervalDuration: const Duration(seconds: 0),
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText: "Bus Location Is collected",
            notificationTitle: "SApp",
            enableWakeLock: true,
          ));
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        activityType: ActivityType.fitness,
        distanceFilter: 1,
        pauseLocationUpdatesAutomatically: true,
        showBackgroundLocationIndicator: true,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
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
        addPointAsMarker(
            'assets/images/bus_5.png',
            position?.latitude ?? 0.0,
            position?.longitude ?? 0.0,
            "assets/images/bus_5.png",
            FFAppState().UserModelState.name,
            100);
      });
      int index = 0;
      FFAppState().fullParentStateList.map((data) async {
        bool withinRadius = GeoUtils.isWithinRadius(
            position?.latitude ?? 0.0,
            position?.longitude ?? 0.0,
            double.parse(data.lat),
            double.parse(data.lng),
            2000);
        if (withinRadius) {
          if (data.isShowOnMap == false) {
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
                    onTap: () => _model.unfocusNode.canRequestFocus
                        ? FocusScope.of(context)
                            .requestFocus(_model.unfocusNode)
                        : FocusScope.of(context).unfocus(),
                    child: ArriveOrDidntWidget(
                      parentModelStruct: data,
                      actionFinish: () {
                        setState(() {
                          FFAppState().updateFullParentStateListAtIndex(index,
                              (value) {
                            data.isShowOnMap = true;
                            return data;
                          });
                        });
                        Navigator.pop(context, true);
                      },
                    ),
                  ),
                );
              },
            ).then((value) {
              if (value != true) {
                setState(() {
                  data.isShowOnMap = false;
                });
              }
            });
          }
        } else {
          print('out');
        }
        index = index + 1;
      }).toList();
      apiStreamLiveLocation(position);
    });
  }

  void apiStreamLiveLocation(Position? position) async {
    if (FFAppState().isLiveLocationStarted) {
      _model.apiResultLiveLocation =
          await StrackerApisGroup.updateLiveLocationCall.call(
              authorization: FFAppState().TokenModelState.token,
              lat: (position?.latitude ?? 0.0).toString(),
              lng: (position?.longitude ?? 0.0).toString());
      if ((_model.apiResultLiveLocation?.succeeded ?? true)) {}
    }
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
                padding: const EdgeInsetsDirectional.fromSTEB(
                    15.0, 10.0, 15.0, 10.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('PersonalPage');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person,
                        color:
                        FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'zm7ebcss' /* Profile */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            fontFamily: 'Cairo',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Stack(
                              children: [
                                if (FFAppState().slectedLanguge == 'ar')
                                  const Icon(
                                    Icons.keyboard_arrow_left,
                                    color: Color(0xFFBFBFC1),
                                    size: 24.0,
                                  ),
                                if (FFAppState().slectedLanguge == 'en')
                                  const Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Color(0xFFBFBFC1),
                                    size: 24.0,
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      15.0, 15.0, 15.0, 15.0),
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
                                  iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
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
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                      color: Colors.white,
                      size: 35.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        10.0, 0.0, 10.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '8ejc2hr8' /* Map */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                ],
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {



                },
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 35.0,
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
                              if (FFAppState().isLiveLocationStarted) {
                                setState(() {
                                  _model.isLoading = true;
                                });
                                _model.apiResultEndTrip =
                                    await StrackerApisGroup.endTripApiCall.call(
                                        authorization:
                                            FFAppState().TokenModelState.token);
                                if ((_model.apiResultEndTrip?.succeeded ??
                                    true)) {
                                  setState(() {
                                    _model.isLoading = false;
                                    FFAppState().isLiveLocationStarted = false;
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
                                        title: Text(FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: 'Error',
                                          arText: 'خطا',
                                        )),
                                        content: Text(getJsonField(
                                          (_model.apiResultqus?.jsonBody ?? ''),
                                          r'''$.message''',
                                        ).toString()),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
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
                                setState(() {
                                  _model.isLoading = true;
                                });
                                _determinePosition().then((value) async {
                                  setState(() {
                                    _model.googleMapsCenter =
                                        LatLng(value.latitude, value.longitude);
                                  });
                                  setState(() {
                                    _model.isLoading = false;
                                  });
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
                                              actionAway();
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {
                                        positionStream.resume();
                                      }));
                                }).catchError((err) {
                                  setState(() {
                                    _model.isLoading = false;
                                  });
                                });
                              }
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
                        text: FFAppState().isLiveLocationStarted
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
                          color: !FFAppState().isLiveLocationStarted
                              ? Color(0xFFCBCBCC)
                              : FlutterFlowTheme.of(context).error,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: !FFAppState().isLiveLocationStarted
                                        ? Color(0xFF000000)
                                        : FlutterFlowTheme.of(context).white,
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

  void actionAway() async {
    setState(() {
      _model.isLoading = true;
    });
    _model.apiResultqus = await StrackerApisGroup.getStudentApiCall.call(
        authorization: FFAppState().TokenModelState.token, goBack: 'away');
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
      FFAppState().fullParentStateList.forEach((element) {
        element.isShowOnMap = false;
      });
      if (FFAppState().fullParentStateList.isEmpty) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text(FFLocalizations.of(context).getVariableText(
                enText: 'Error',
                arText: 'خطا',
              )),
              content: Text('لا يوجد طلاب للحضور'),
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
        return;
      }
      setState(() {
        FFAppState().isLiveLocationStarted = true;
      });
      FFAppState().fullParentStateList.forEach((data) async {
        _model.students?.addAll(data.students);
      });
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
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: ArriveOrDidntAwayWidget(
                students: _model.students,
                actionFinish: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
      ).then((value) {
        Navigator.pop(context);
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

  void actionGO() async {
    setState(() {
      _model.isLoading = true;
    });
    _model.apiResultqus = await StrackerApisGroup.getStudentApiCall
        .call(authorization: FFAppState().TokenModelState.token, goBack: 'go');
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
        FFAppState().fullParentStateList.forEach((element) {
          element.isShowOnMap = false;
        });
      });
      if (FFAppState().fullParentStateList.isEmpty) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text(FFLocalizations.of(context).getVariableText(
                enText: 'Error',
                arText: 'خطا',
              )),
              content: Text('لا يوجد طلاب للاضافة'),
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
        return;
      }
      setState(() {
        FFAppState().isLiveLocationStarted = true;
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
