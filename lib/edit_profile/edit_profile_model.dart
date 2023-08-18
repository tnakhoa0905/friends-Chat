import '/backend/supabase/supabase.dart';
import '/components/chang_image_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
 
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for phoneNumber widget.
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  // State field(s) for email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  DateTime? datePicked;
  // State field(s) for date widget.
  TextEditingController? dateController;
  String? Function(BuildContext, String?)? dateControllerValidator;

  void initState(BuildContext context) {}

  void dispose() {
    
     unfocusNode.dispose();
    textController1?.dispose();
    phoneNumberController?.dispose();
    emailController?.dispose();
    dateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
