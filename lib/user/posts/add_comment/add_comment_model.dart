import '/flutter_flow/flutter_flow_util.dart';
import 'add_comment_widget.dart' show AddCommentWidget;
import 'package:flutter/material.dart';

class AddCommentModel extends FlutterFlowModel<AddCommentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for folderTitle widget.
  FocusNode? folderTitleFocusNode;
  TextEditingController? folderTitleTextController;
  String? Function(BuildContext, String?)? folderTitleTextControllerValidator;
  String? _folderTitleTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Title is required.';
    }

    return null;
  }

  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  @override
  void initState(BuildContext context) {
    folderTitleTextControllerValidator = _folderTitleTextControllerValidator;
  }

  @override
  void dispose() {
    folderTitleFocusNode?.dispose();
    folderTitleTextController?.dispose();
  }
}
