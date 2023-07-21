import '/components/message_bubbles_focused_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MessageEmojiModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for messageBubbles_Focused component.
  late MessageBubblesFocusedModel messageBubblesFocusedModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    messageBubblesFocusedModel =
        createModel(context, () => MessageBubblesFocusedModel());
  }

  void dispose() {
    messageBubblesFocusedModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
