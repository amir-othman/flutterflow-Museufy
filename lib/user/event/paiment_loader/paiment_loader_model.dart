import '/flutter_flow/flutter_flow_util.dart';
import '/user/event/loader/loader_widget.dart';
import 'paiment_loader_widget.dart' show PaimentLoaderWidget;
import 'package:flutter/material.dart';

class PaimentLoaderModel extends FlutterFlowModel<PaimentLoaderWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for loader component.
  late LoaderModel loaderModel;

  @override
  void initState(BuildContext context) {
    loaderModel = createModel(context, () => LoaderModel());
  }

  @override
  void dispose() {
    loaderModel.dispose();
  }
}
