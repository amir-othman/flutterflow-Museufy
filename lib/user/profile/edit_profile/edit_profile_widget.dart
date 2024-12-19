import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/alert/alert_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.picture = currentUserPhoto;
      safeSetState(() {});
    });

    _model.firstNameTextController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.firstNameFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.arrow_back_outlined,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                HapticFeedback.lightImpact();

                context.pushNamed('Profile');
              },
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Edit Profile',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Inter Tight',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: const Icon(
                        Icons.share_outlined,
                        color: Colors.transparent,
                        size: 1.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Align(
          alignment: const AlignmentDirectional(0.0, -1.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    safeSetState(
                                        () => _model.isDataUploading = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();
                                    } finally {
                                      _model.isDataUploading = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFile =
                                            selectedUploadedFiles.first;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }

                                  _model.url =
                                      await actions.uploadFileToCloudinary(
                                    context,
                                    _model.uploadedLocalFile,
                                  );
                                  if ((_model.uploadedLocalFile.bytes
                                              ?.isNotEmpty ??
                                          false)) {
                                    _model.picture = _model.url;
                                    safeSetState(() {});
                                  }

                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 120.0,
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        _model.picture!,
                                      ).image,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Visibility(
                                    visible: _model.picture == null ||
                                        _model.picture == '',
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.upload_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 36.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PICTURE IDEAS',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 10.0,
                                            letterSpacing: 1.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Wrap(
                                        spacing: 12.0,
                                        runSpacing: 12.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              HapticFeedback.selectionClick();
                                              _model.picture =
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/futur-musum-p7oyv0/assets/bhuvt6hy2bwv/ed21d973162f9e76fa1fab2a7507e9cd.jpg';
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 55.0,
                                              height: 55.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/futur-musum-p7oyv0/assets/bhuvt6hy2bwv/ed21d973162f9e76fa1fab2a7507e9cd.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              HapticFeedback.selectionClick();
                                              _model.picture =
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/futur-musum-p7oyv0/assets/ytg7eu31fe0i/ecf2feb9bbd41ff1875da5a05e5d17ec_(1).jpg';
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 55.0,
                                              height: 55.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/futur-musum-p7oyv0/assets/ytg7eu31fe0i/ecf2feb9bbd41ff1875da5a05e5d17ec_(1).jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              HapticFeedback.selectionClick();
                                              _model.picture =
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/futur-musum-p7oyv0/assets/den7qf16bh7t/721401432dbf2ff122db5be99e78ca46.jpg';
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 55.0,
                                              height: 55.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/futur-musum-p7oyv0/assets/den7qf16bh7t/721401432dbf2ff122db5be99e78ca46.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              HapticFeedback.selectionClick();
                                              _model.picture =
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/futur-musum-p7oyv0/assets/iom1ksxzykba/b2fc105dd6e0c618e1d2a7027adc73b4.jpg';
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 55.0,
                                              height: 55.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/futur-musum-p7oyv0/assets/iom1ksxzykba/b2fc105dd6e0c618e1d2a7027adc73b4.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              HapticFeedback.selectionClick();
                                              _model.picture =
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/futur-musum-p7oyv0/assets/73n7dc5wgacy/31f5095514322024b16d42d042e0a4cc.jpg';
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 55.0,
                                              height: 55.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/futur-musum-p7oyv0/assets/73n7dc5wgacy/31f5095514322024b16d42d042e0a4cc.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              HapticFeedback.selectionClick();
                                              _model.picture =
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/futur-musum-p7oyv0/assets/sr1o53axhkzc/1ae461892d3bc0cbd6293ded4bc537b7.jpg';
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 55.0,
                                              height: 55.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/futur-musum-p7oyv0/assets/sr1o53axhkzc/1ae461892d3bc0cbd6293ded4bc537b7.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 6.0)),
                                ),
                              ),
                            ].divide(const SizedBox(width: 24.0)),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: AuthUserStreamWidget(
                                    builder: (context) => SizedBox(
                                      width: 100.0,
                                      child: TextFormField(
                                        controller:
                                            _model.firstNameTextController,
                                        focusNode: _model.firstNameFocusNode,
                                        autofocus: false,
                                        autofillHints: const [
                                          AutofillHints.givenName
                                        ],
                                        textCapitalization:
                                            TextCapitalization.words,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Your Name',
                                          hintText: 'Your Name',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        validator: _model
                                            .firstNameTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 12.0)),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 20.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      HapticFeedback.lightImpact();
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }

                      await currentUserReference!.update(createUsersRecordData(
                        photoUrl: _model.picture,
                        displayName: _model.firstNameTextController.text,
                      ));
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: AlertWidget(
                                image:
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/futur-musum-p7oyv0/assets/qv7v9b5zdvtx/Animation_-_1734383488641.gif',
                                title: 'Nice New Look  !',
                                alert: 'Profile updated successfully ',
                                action: () async {
                                  context.pushNamed('Profile');
                                },
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    text: 'Save Changes',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 55.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ]
                  .divide(const SizedBox(height: 12.0))
                  .addToStart(const SizedBox(height: 24.0))
                  .addToEnd(const SizedBox(height: 32.0)),
            ),
          ),
        ),
      ),
    );
  }
}
