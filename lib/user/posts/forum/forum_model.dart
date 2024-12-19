import '/flutter_flow/flutter_flow_util.dart';
import '/pages/nav_bar/nav_bar_widget.dart';
import 'forum_widget.dart' show ForumWidget;
import 'package:flutter/material.dart';

class ForumModel extends FlutterFlowModel<ForumWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navBarModel.dispose();
  }
}
