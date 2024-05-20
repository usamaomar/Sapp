import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_students_page_model.dart';
export 'add_students_page_model.dart';

class AddStudentsPageWidget extends StatefulWidget {
  const AddStudentsPageWidget({super.key});

  @override
  State<AddStudentsPageWidget> createState() => _AddStudentsPageWidgetState();
}

class _AddStudentsPageWidgetState extends State<AddStudentsPageWidget> {
  late AddStudentsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddStudentsPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiGetBranches = await StrackerApisGroup.getBranchesApiCall.call(
        authorization: FFAppState().TokenModelState.token,
      );
      if ((_model.apiGetBranches?.succeeded ?? true)) {
        setState(() {
          _model.listOfLocals = (_model.apiGetBranches?.jsonBody['branches']
              .toList()
              .map<BranchStruct?>(BranchStruct.maybeFromMap)
              .toList() as Iterable<BranchStruct?>)
              .withoutNulls
              .toList() ??
              [];
        });
      }
    });
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
                    'sd5npisy' /* Add Student */,
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
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if(_model.textController.text.isEmpty){
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text(FFLocalizations.of(context).getVariableText(
                                  enText: 'Alert',
                                  arText: 'تحذير',
                                )),
                                content: Text(FFLocalizations.of(context).getVariableText(
                                  enText: 'Name Must Not Be Empty',
                                  arText: 'يجب ان لا يكون الاسم فارغا',
                                )),
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

                        if(_model.uploadedLocalFile.name == null){
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text(FFLocalizations.of(context).getVariableText(
                                  enText: 'Alert',
                                  arText: 'تحذير',
                                )),
                                content: Text(FFLocalizations.of(context).getVariableText(
                                  enText: 'Image Must Not Be Empty',
                                  arText: 'يجب ان لا تكون الصورة فارغه',
                                )),
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


                        if(_model.selectedBranch == null){
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text(FFLocalizations.of(context).getVariableText(
                                  enText: 'Alert',
                                  arText: 'تحذير',
                                )),
                                content: Text(FFLocalizations.of(context).getVariableText(
                                  enText: 'Branch Must Not Be Empty',
                                  arText: 'يجب ان تختار الفرع',
                                )),
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
                        _model.apiResult96w =
                            await StrackerApisGroup.newStudentApiCall.call(
                          studentName: _model.textController.text,
                          studentImage: _model.uploadedLocalFile,
                          branchId: _model.selectedBranch?.id,
                          authorization: FFAppState().TokenModelState.token,
                        );
                        if ((_model.apiResult96w?.succeeded ?? true)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                FFLocalizations.of(context).getVariableText(
                                  enText: 'Success',
                                  arText: 'تمت العملية بنجاح',
                                ),
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  Colors.lightBlue,
                            ),
                          );
                        }
                        Navigator.pop(context,true);
                        setState(() {});
                      },
                      child: Icon(
                        Icons.save,
                        color: FlutterFlowTheme.of(context).white,
                        size: 24.0,
                      ),
                    ),
                  ],
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    16.0, 15.0, 16.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'k07gswuf' /* Add Student Image */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  final selectedMedia =
                  await selectMediaWithSourceBottomSheet(
                    context: context,
                    allowPhoto: true,
                  );
                  if (selectedMedia != null &&
                      selectedMedia.every((m) =>
                          validateFileFormat(m.storagePath, context))) {
                    setState(() => _model.isDataUploading = true);
                    var selectedUploadedFiles = <FFUploadedFile>[];
                    try {
                      selectedUploadedFiles = selectedMedia
                          .map((m) => FFUploadedFile(
                        name: m.storagePath.split('/').last,
                        bytes: m.bytes,
                        height: m.dimensions?.height,
                        width: m.dimensions?.width,
                        blurHash: m.blurHash,
                      ))
                          .toList();
                    } finally {
                      _model.isDataUploading = false;
                    }
                    if (selectedUploadedFiles.length ==
                        selectedMedia.length) {
                      setState(() {
                        _model.uploadedLocalFile =
                            selectedUploadedFiles.first;
                      });
                    } else {
                      setState(() {});
                      return;
                    }
                  }
                },
                child: Stack(
                  children: [
                    _model.uploadedLocalFile.name!=null ?  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120.0,
                          height: 120.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.memory(
                            _model.uploadedLocalFile.bytes ?? Uint8List.fromList([]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ) : Container(),
                    _model.uploadedLocalFile.name == null ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120.0,
                          height: 120.0,
                          decoration: const BoxDecoration(
                            color: Colors.black26,
                            shape: BoxShape.circle,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.upload_file_sharp,
                                color: FlutterFlowTheme.of(context).secondaryText,
                                size: 44.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ) : Container(),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '9h9xapb5' /* Add Student Name */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      8.0, 20.0, 8.0, 20.0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'cdb7hzor' /* Name */,
                      ),
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0.0,
                              ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 16.0, 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'z8uwoplo' /* Select Branch */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _model.listOfLocals.length,
                itemBuilder: (context, localListIndex) {
                  final localListItem = _model.listOfLocals[localListIndex];
                  return Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context)
                            .secondaryBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 15.0, 16.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 25.0,
                                  height: 25.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Image.network(
                                    'https://picsum.photos/seed/323/600',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional
                                      .fromSTEB(15.0, 0.0, 15.0, 0.0),
                                  child: Text(
                                    localListItem.name,
                                    style:
                                    FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily:
                                      'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _model.listOfLocals
                                      .map(
                                          (e) => e.isSelected = false)
                                      .toList();
                                  _model.listOfLocals.map((e) {
                                    if (e.id == localListItem.id) {
                                      localListItem.isSelected = true;
                                      _model.selectedBranch = localListItem;
                                    }
                                  }).toList();
                                });
                              },
                              child: Stack(
                                children: [
                                  localListItem.isSelected
                                      ? Icon(
                                    Icons.radio_button_checked,
                                    color: FlutterFlowTheme.of(
                                        context)
                                        .warning,
                                    size: 24.0,
                                  )
                                      : Icon(
                                    Icons.radio_button_off,
                                    color: FlutterFlowTheme.of(
                                        context)
                                        .warning,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
