import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_event_step2_widget.dart' show AddEventStep2Widget;
import 'package:flutter/material.dart';

class AddEventStep2Model extends FlutterFlowModel<AddEventStep2Widget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for desc widget.
  FocusNode? descFocusNode;
  TextEditingController? descTextController;
  String? Function(BuildContext, String?)? descTextControllerValidator;
  String? _descTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();

  @override
  void initState(BuildContext context) {
    descTextControllerValidator = _descTextControllerValidator;
  }

  @override
  void dispose() {
    descFocusNode?.dispose();
    descTextController?.dispose();
  }
}
