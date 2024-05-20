import 'package:flutter/cupertino.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_students_page_model.dart';
export 'my_students_page_model.dart';

class MyStudentsPageWidget extends StatefulWidget {
  const MyStudentsPageWidget({super.key});

  @override
  State<MyStudentsPageWidget> createState() => _MyStudentsPageWidgetState();
}

class _MyStudentsPageWidgetState extends State<MyStudentsPageWidget> {
  late MyStudentsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyStudentsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

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
        backgroundColor: FlutterFlowTheme.of(context).white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onTap: () async {
                  context.pop();
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '64v3k77t' /* My Students */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    context.pushNamed('AddStudentsPage');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.add_circle,
                        color: FlutterFlowTheme.of(context).white,
                        size: 24.0,
                      ),
                    ],
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
          child: FutureBuilder<ApiCallResponse>(
            future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                  ..complete(StrackerApisGroup.myStudentsApiCall.call(
                    authorization: FFAppState().TokenModelState.token,
                  )))
                .future,
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final listViewMyStudentsApiResponse = snapshot.data!;
              return Builder(
                builder: (context) {
                  final localList = MyStudentListModelStruct.maybeFromMap(
                              listViewMyStudentsApiResponse.jsonBody)
                          ?.myStudents
                          .map((e) => e)
                          .toList()
                          .toList() ??
                      [];
                  return RefreshIndicator(
                    onRefresh: () async {
                      setState(() => _model.apiRequestCompleter = null);
                      await _model.waitForApiRequestCompleted();
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: localList.length,
                      itemBuilder: (context, localListIndex) {
                        final localListItem = localList[localListIndex];
                        return Container(
                          margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).white,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 5.0, 16.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      localListItem.studentName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: localListItem
                                              .pathStudentImage.isEmpty
                                          ? Container()
                                          : Image.network(
                                              localListItem.pathStudentImage,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.black26,
                                height: 1,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
