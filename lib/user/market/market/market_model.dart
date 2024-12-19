import '/flutter_flow/flutter_flow_util.dart';
import '/pages/nav_bar/nav_bar_widget.dart';
import 'market_widget.dart' show MarketWidget;
import 'package:flutter/material.dart';

class MarketModel extends FlutterFlowModel<MarketWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
