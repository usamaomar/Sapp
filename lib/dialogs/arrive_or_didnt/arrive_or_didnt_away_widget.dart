import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../../backend/api_requests/api_calls.dart';
import '../../backend/schema/structs/parent_model_struct.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'arrive_or_didnt_away_model.dart';
export 'arrive_or_didnt_away_model.dart';

class ArriveOrDidntAwayWidget extends StatefulWidget {
  late ParentModelStruct parentModelStruct;
  final void Function()? actionFinish;


  ArriveOrDidntAwayWidget({super.key, required this.parentModelStruct,required this.actionFinish});

  @override
  State<ArriveOrDidntAwayWidget> createState() => _ArriveOrDidntAwayWidgetState();
}

class _ArriveOrDidntAwayWidgetState extends State<ArriveOrDidntAwayWidget> {
  late ArriveOrDidntAwayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArriveOrDidntAwayModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close_sharp,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 121.0,
                    height: 121.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        widget.parentModelStruct.pathUserImage,
                        width: 120.0,
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 121.0,
                    height: 121.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        widget.parentModelStruct.pathAnotherParentImage,
                        width: 120.0,
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: FlutterFlowSwipeableStack(
                  onSwipeFn: (index) {
                   if((widget.parentModelStruct.students.length - 1) == index){
                     widget.actionFinish?.call();
                   }
                  },
                  onLeftSwipe: (index) async{
                    _model.apiUpdateStudentStatusApiCall =
                        await StrackerApisGroup.updateStudentStatusApiCall.call(
                        authorization: FFAppState().TokenModelState.token,
                        studentId: widget
                            .parentModelStruct.students[index].id
                            .toString(),
                        status: 'present');
                    if ((_model.apiUpdateStudentStatusApiCall?.succeeded ??
                        true)) {
                    } else {
                      await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text(
                              FFLocalizations.of(context).getVariableText(
                                enText: 'Error',
                                arText: 'خطا',
                              )),
                          content: Text(getJsonField(
                            (_model.apiUpdateStudentStatusApiCall?.jsonBody ??
                                ''),
                            r'''$.message''',
                          ).toString()),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text(
                                  FFLocalizations.of(context).getVariableText(
                                    enText: 'Ok',
                                    arText: 'حسنا',
                                  )),
                            ),
                          ],
                        );
                      },
                      );
                    }
                  },
                  onRightSwipe: (index) async {
                    _model.apiUpdateStudentStatusApiCall =
                        await StrackerApisGroup.updateStudentStatusApiCall.call(
                            authorization: FFAppState().TokenModelState.token,
                            studentId: widget
                                .parentModelStruct.students[index].id
                                .toString(),
                            status: 'present');
                    if ((_model.apiUpdateStudentStatusApiCall?.succeeded ??
                        true)) {
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text(
                                FFLocalizations.of(context).getVariableText(
                              enText: 'Error',
                              arText: 'خطا',
                            )),
                            content: Text(getJsonField(
                              (_model.apiUpdateStudentStatusApiCall?.jsonBody ??
                                  ''),
                              r'''$.message''',
                            ).toString()),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text(
                                    FFLocalizations.of(context).getVariableText(
                                  enText: 'Ok',
                                  arText: 'حسنا',
                                )),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  onUpSwipe: (index) {},
                  onDownSwipe: (index) {},
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        widget
                            .parentModelStruct.students[index].pathStudentImage,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  itemCount: widget.parentModelStruct.students.length,
                  controller: _model.swipeableStackController,
                  loop: false,
                  cardDisplayCount: 3,
                  scale: 0.9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
