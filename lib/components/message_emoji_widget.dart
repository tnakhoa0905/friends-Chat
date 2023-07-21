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
import 'message_emoji_model.dart';
export 'message_emoji_model.dart';

class MessageEmojiWidget extends StatefulWidget {
  const MessageEmojiWidget({
    Key? key,
    this.blueBubble,
    this.messageText,
  }) : super(key: key);

  final bool? blueBubble;
  final String? messageText;

  @override
  _MessageEmojiWidgetState createState() => _MessageEmojiWidgetState();
}

class _MessageEmojiWidgetState extends State<MessageEmojiWidget>
    with TickerProviderStateMixin {
  late MessageEmojiModel _model;

  final animationsMap = {
    'blurOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'messageBubblesFocusedOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: Offset(0.8, 0.8),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageEmojiModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 8.0,
                sigmaY: 8.0,
              ),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().update(() {
                    FFAppState().messageReaction = false;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x4C000000),
                  ),
                ),
              ),
            ),
          ).animateOnPageLoad(animationsMap['blurOnPageLoadAnimation']!),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: wrapWithModel(
                    model: _model.messageBubblesFocusedModel,
                    updateCallback: () => setState(() {}),
                    child: MessageBubblesFocusedWidget(
                      mesageText: widget.messageText,
                      blueBubble: widget.blueBubble,
                    ),
                  ).animateOnPageLoad(animationsMap[
                      'messageBubblesFocusedOnPageLoadAnimation']!),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
