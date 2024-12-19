import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'map_model.dart';
export 'map_model.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> with TickerProviderStateMixin {
  late MapModel _model;

  var hasContainerTriggered1 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: false,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 200.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.1, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 300.0),
          ),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
          BlurEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(60.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 800.ms),
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 800.0.ms,
            duration: 600.0.ms,
            begin: const Offset(2.5, 1.0),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 800.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 800.0.ms,
            duration: 600.0.ms,
            begin: const Offset(10.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 800.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-100.0, 70.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(0.5, 1.0),
          ),
          BlurEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(40.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 200.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 500.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 500.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 500.0.ms,
            duration: 400.0.ms,
            begin: const Offset(20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 500.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: const Offset(2.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: const Offset(10.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 70.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'cardOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 700.ms),
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 700.0.ms,
            duration: 400.0.ms,
            begin: const Offset(2.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 700.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 700.0.ms,
            duration: 400.0.ms,
            begin: const Offset(10.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 700.0.ms,
            duration: 400.0.ms,
            begin: const Offset(100.0, 70.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      animationsMap['containerOnPageLoadAnimation1']!
          .controller
          .forward(from: 0.0);
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(100.0),
                topRight: Radius.circular(100.0),
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 100.0,
                      color: Color(0x1A000000),
                      offset: Offset(
                        0.0,
                        20.0,
                      ),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(100.0),
                    topRight: Radius.circular(100.0),
                  ),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    width: 2.0,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 500.0,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 32.0, 0.0, 0.0),
                                child: PageView(
                                  controller: _model.pageViewController ??=
                                      PageController(initialPage: 0),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 32.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 44.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0x86C77DFF),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(4.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Flexible(
                                                              child: Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Our Events Locations',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter Tight',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            20.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'textOnPageLoadAnimation']!),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                        .animateOnPageLoad(
                                                            animationsMap[
                                                                'containerOnPageLoadAnimation2']!)
                                                        .animateOnActionTrigger(
                                                          animationsMap[
                                                              'containerOnActionTriggerAnimation2']!,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    borderRadius: 30.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 50.0,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    icon: Icon(
                                                      Icons.close_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      Navigator.pop(context);
                                                    },
                                                  ).animateOnPageLoad(animationsMap[
                                                      'iconButtonOnPageLoadAnimation']!),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Card(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color: Colors.transparent,
                                                      elevation: 0.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.0),
                                                      ),
                                                      child: Container(
                                                        width: 125.0,
                                                        height: 615.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: StreamBuilder<
                                                            List<EventRecord>>(
                                                          stream:
                                                              queryEventRecord(),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<EventRecord>
                                                                googleMapEventRecordList =
                                                                snapshot.data!;

                                                            return FlutterFlowGoogleMap(
                                                              controller: _model
                                                                  .googleMapsController,
                                                              onCameraIdle:
                                                                  (latLng) =>
                                                                      _model.googleMapsCenter =
                                                                          latLng,
                                                              initialLocation: _model
                                                                      .googleMapsCenter ??=
                                                                  const LatLng(
                                                                      33.886917,
                                                                      9.537499),
                                                              markers:
                                                                  googleMapEventRecordList
                                                                      .map(
                                                                        (marker) =>
                                                                            FlutterFlowMarker(
                                                                          marker
                                                                              .reference
                                                                              .path,
                                                                          marker
                                                                              .location!,
                                                                        ),
                                                                      )
                                                                      .toList(),
                                                              markerColor:
                                                                  GoogleMarkerColor
                                                                      .violet,
                                                              mapType: MapType
                                                                  .normal,
                                                              style:
                                                                  GoogleMapStyle
                                                                      .standard,
                                                              initialZoom: 9.0,
                                                              allowInteraction:
                                                                  true,
                                                              allowZoom: true,
                                                              showZoomControls:
                                                                  true,
                                                              showLocation:
                                                                  true,
                                                              showCompass:
                                                                  false,
                                                              showMapToolbar:
                                                                  false,
                                                              showTraffic:
                                                                  false,
                                                              centerMapOnMarkerTap:
                                                                  true,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'cardOnPageLoadAnimation']!),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2.0,
                                            indent: 20.0,
                                            endIndent: 20.0,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 32.0, 0.0, 0.0),
                                  child:
                                      smooth_page_indicator.SmoothPageIndicator(
                                    controller: _model.pageViewController ??=
                                        PageController(initialPage: 0),
                                    count: 1,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) async {
                                      await _model.pageViewController!
                                          .animateToPage(
                                        i,
                                        duration: const Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                      safeSetState(() {});
                                    },
                                    effect: smooth_page_indicator
                                        .ExpandingDotsEffect(
                                      expansionFactor: 4.0,
                                      spacing: 8.0,
                                      radius: 16.0,
                                      dotWidth: 12.0,
                                      dotHeight: 4.0,
                                      dotColor:
                                          FlutterFlowTheme.of(context).primary,
                                      activeDotColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
                .animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation1']!)
                .animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation1']!,
                    hasBeenTriggered: hasContainerTriggered1),
          ),
        ),
      ],
    );
  }
}
