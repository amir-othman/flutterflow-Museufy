import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_event_widget.dart' show EditEventWidget;
import 'package:flutter/material.dart';

class EditEventModel extends FlutterFlowModel<EditEventWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for name widget.
  FocusNode? nameFocusNode1;
  TextEditingController? nameTextController1;
  String? Function(BuildContext, String?)? nameTextController1Validator;
  // State field(s) for desc widget.
  FocusNode? descFocusNode1;
  TextEditingController? descTextController1;
  String? Function(BuildContext, String?)? descTextController1Validator;
  DateTime? datePicked;
  // State field(s) for desc widget.
  FocusNode? descFocusNode2;
  TextEditingController? descTextController2;
  String? Function(BuildContext, String?)? descTextController2Validator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  // State field(s) for name widget.
  FocusNode? nameFocusNode2;
  TextEditingController? nameTextController2;
  String? Function(BuildContext, String?)? nameTextController2Validator;
  // State field(s) for desc widget.
  FocusNode? descFocusNode3;
  TextEditingController? descTextController3;
  String? Function(BuildContext, String?)? descTextController3Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileToCloudinary] action in Button widget.
  String? url;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode1?.dispose();
    nameTextController1?.dispose();

    descFocusNode1?.dispose();
    descTextController1?.dispose();

    descFocusNode2?.dispose();
    descTextController2?.dispose();

    nameFocusNode2?.dispose();
    nameTextController2?.dispose();

    descFocusNode3?.dispose();
    descTextController3?.dispose();
  }
}
