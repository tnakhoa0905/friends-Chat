import '../auth/supabase_auth/auth_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '/backend/supabase/supabase.dart';
import '/components/chang_image_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({Key? key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget>
    with TickerProviderStateMixin {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0, 60),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Chỉnh sửa thông tin',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Lexend Deca',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment(0, 0),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 500),
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                  child: FutureBuilder<List<UserRow>>(
                    future: UserTable().querySingleRow(
                      queryFn: (q) => q.eq(
                        'id',
                        currentUserUid,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<UserRow> containerUserRowList = snapshot.data!;
                      final containerUserRow = containerUserRowList.isNotEmpty
                          ? containerUserRowList.first
                          : null;
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          // crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Container(
                                  width: 80.0,
                                  height: 80.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    containerUserRow!.avt!,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 12.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await showAlignedDialog(
                                      context: context,
                                      isGlobal: true,
                                      avoidOverflow: false,
                                      targetAnchor: AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      followerAnchor: AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      builder: (dialogContext) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode),
                                            child: ChangImageWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                                  text: 'Chỉnh sửa ảnh',
                                  options: FFButtonOptions(
                                    width: 130.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _model.textController1 ??=
                                          TextEditingController(
                                        text: containerUserRow?.name,
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF95A1AC),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      maxLines: null,
                                      validator: _model.textController1Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller:
                                          _model.phoneNumberController ??=
                                              TextEditingController(
                                        text: containerUserRow?.phoneNumber,
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF95A1AC),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      maxLines: null,
                                      validator: _model
                                          .phoneNumberControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _model.emailController ??=
                                          TextEditingController(
                                        text: containerUserRow?.email,
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      maxLines: null,
                                      validator: _model.emailControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Generated code for this Container Widget...
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 16),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final _datePickedDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: getCurrentTimestamp,
                                      firstDate: getCurrentTimestamp,
                                      lastDate: DateTime(2050),
                                    );
                                    TimeOfDay? _datePickedTime;
                                    if (_datePickedDate != null) {
                                      _datePickedTime = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            getCurrentTimestamp),
                                      );
                                    }
                                    if (_datePickedDate != null &&
                                        _datePickedTime != null) {
                                      setState(() {
                                        _model.datePicked = DateTime(
                                          _datePickedDate.year,
                                          _datePickedDate.month,
                                          _datePickedDate.day,
                                          _datePickedTime!.hour,
                                          _datePickedTime.minute,
                                        );
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 1,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 14, 8, 14),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 0),
                                            child: Text(
                                              _model.datePicked == null
                                                  ? dateTimeFormat(
                                                      'yMd',
                                                      containerUserRow!
                                                          .dateOfBirth!)
                                                  : dateTimeFormat(
                                                      'yMd', _model.datePicked),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),

                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await UserTable().update(
                                    data: {
                                      'name': _model.textController1.text,
                                      'phone_number':
                                          _model.phoneNumberController.text,
                                      'email': _model.emailController.text,
                                      'date_of_birth': _model.datePicked == null
                                          ? containerUserRow.dateOfBirth!
                                              .toIso8601String()
                                          : _model.datePicked?.toIso8601String()
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      containerUserRow.id,
                                    ),
                                  );
                                  setState(() {});
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Update susscess',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  );
                                },
                                text: 'Save Changes',
                                options: FFButtonOptions(
                                  width: 230.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF4B39EF),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
