import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../../backend/schema/structs/parent_model_struct.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'arrive_or_didnt_model.dart';
export 'arrive_or_didnt_model.dart';

class ArriveOrDidntWidget extends StatefulWidget {

  late ParentModelStruct parentModelStruct;


    ArriveOrDidntWidget({super.key,required this.parentModelStruct});

  @override
  State<ArriveOrDidntWidget> createState() => _ArriveOrDidntWidgetState();
}

class _ArriveOrDidntWidgetState extends State<ArriveOrDidntWidget> {
  late ArriveOrDidntModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArriveOrDidntModel());
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://picsum.photos/seed/433/600',
                        width: 140.0,
                        height: 140.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
              //   child: Column(
              //     mainAxisSize: MainAxisSize.max,
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       FFButtonWidget(
              //         onPressed: () {
              //           print('Button pressed ...');
              //         },
              //         text: FFLocalizations.of(context).getText(
              //           'atyxkt8z' /* Arrive */,
              //         ),
              //         options: FFButtonOptions(
              //           height: 40.0,
              //           padding: const EdgeInsetsDirectional.fromSTEB(
              //               24.0, 0.0, 24.0, 0.0),
              //           iconPadding:
              //           const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              //           color: FlutterFlowTheme.of(context).primary,
              //           textStyle:
              //           FlutterFlowTheme.of(context).titleSmall.override(
              //             fontFamily: 'Readex Pro',
              //             color: Colors.white,
              //             letterSpacing: 0.0,
              //           ),
              //           elevation: 3.0,
              //           borderSide: const BorderSide(
              //             color: Colors.transparent,
              //             width: 1.0,
              //           ),
              //           borderRadius: BorderRadius.circular(8.0),
              //         ),
              //       ),
              //       Container(
              //         margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
              //         child: FFButtonWidget(
              //           onPressed: () {
              //             print('Button pressed ...');
              //           },
              //           text: FFLocalizations.of(context).getText(
              //             'upbiufi5' /* Not Arrived */,
              //           ),
              //           options: FFButtonOptions(
              //             height: 40.0,
              //             padding: const EdgeInsetsDirectional.fromSTEB(
              //                 24.0, 0.0, 24.0, 0.0),
              //             iconPadding:
              //             const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              //             color: const Color(0xFFFF0000),
              //             textStyle:
              //             FlutterFlowTheme.of(context).titleSmall.override(
              //               fontFamily: 'Readex Pro',
              //               color: Colors.white,
              //               letterSpacing: 0.0,
              //             ),
              //             elevation: 3.0,
              //             borderSide: const BorderSide(
              //               color: Colors.transparent,
              //               width: 1.0,
              //             ),
              //             borderRadius: BorderRadius.circular(8.0),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
