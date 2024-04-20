import '../../backend/api_requests/api_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'arrive_or_didnt_away_widget.dart';

class ArriveOrDidntAwayModel extends FlutterFlowModel<ArriveOrDidntAwayWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  ApiCallResponse? apiUpdateStudentStatusApiCall;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {}
}
