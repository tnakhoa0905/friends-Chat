import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pinned_message_model.dart';
export 'pinned_message_model.dart';

class PinnedMessageWidget extends StatefulWidget {
  const PinnedMessageWidget({
    Key? key,
    this.messageImage,
    this.messageTitle,
    this.isUnread,
    String? messageContent,
  })  : this.messageContent = messageContent ?? ' ',
        super(key: key);

  final String? messageImage;
  final String? messageTitle;
  final bool? isUnread;
  final String messageContent;

  @override
  _PinnedMessageWidgetState createState() => _PinnedMessageWidgetState();
}

class _PinnedMessageWidgetState extends State<PinnedMessageWidget> {
  late PinnedMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PinnedMessageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 120.0,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFC9C9C9),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          widget.messageImage!,
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6.0,
                          color: Color(0x29000000),
                          offset: Offset(2.0, 4.0),
                        )
                      ],
                      shape: BoxShape.circle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.isUnread ?? true)
                          Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                3.0, 0.0, 0.0, 0.0),
                            child: Text(
                              widget.messageTitle!.maybeHandleOverflow(
                                maxChars: 14,
                                replacement: '…',
                              ),
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 12.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (widget.isUnread ?? true)
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  height: 26.0,
                  decoration: BoxDecoration(
                    color: Color(0xEFFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8.0,
                        color: Color(0x26000000),
                        offset: Offset(1.0, 1.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.messageContent,
                          'Hello world!',
                        ).maybeHandleOverflow(
                          maxChars: 10,
                          replacement: '…',
                        ),
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 13.0,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
