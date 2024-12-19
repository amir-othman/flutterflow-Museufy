import '/flutter_flow/flutter_flow_util.dart';
import '/pages/nav_bar/nav_bar_widget.dart';
import 'events_widget.dart' show EventsWidget;
import 'package:flutter/material.dart';

class EventsModel extends FlutterFlowModel<EventsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    navBarModel.dispose();
  }
}
