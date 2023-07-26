import 'package:timeago/timeago.dart';

import '../models/message.dart';
import '../models/profile.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'audio_chat_demo_model.dart';
export 'audio_chat_demo_model.dart';
import '/auth/supabase_auth/auth_util.dart';

class AudioChatDemoWidget extends StatefulWidget {
  const AudioChatDemoWidget({
    Key? key,
    required this.idChat,
  }) : super(key: key);

  final String idChat;

  @override
  _AudioChatDemoWidgetState createState() => _AudioChatDemoWidgetState();
}

class _AudioChatDemoWidgetState extends State<AudioChatDemoWidget> {
  late AudioChatDemoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late final Stream<List<Message>> _messagesStream;
  final Map<String, Profile> _profileCache = {};
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AudioChatDemoModel());

    _model.textController ??= TextEditingController();
    _messagesStream = SupaFlow.client
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map((maps) => maps
            .map((map) => Message.fromMap(map, currentUser!.uid!))
            .toList());
    print(_messagesStream);
  }

  Future<void> _loadProfileCache(
    String profileId,
  ) async {
    if (_profileCache[profileId] != null) {
      return;
    }
    final data = await SupaFlow.client
        .from('user')
        .select()
        .eq('id', profileId)
        .single();
    print(data);
    final profile = Profile.fromMap(data);
    setState(() {
      _profileCache[profileId] = profile;
    });
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
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xF2FFFFFF),
          body: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/wallpaper.jpg',
                ).image,
              ),
            ),
            child: Stack(children: [
              Column(
                children: [
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 2.0,
                          sigmaY: 2.0,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 2.0),
                          child: FutureBuilder<List<FriendRow>>(
                            future: FriendTable().querySingleRow(
                              queryFn: (q) => q
                                  .eq(
                                    'id_user',
                                    currentUserUid,
                                  )
                                  .eq(
                                    'id_friends',
                                    widget.idChat,
                                  ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 8),
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
                              List<FriendRow> columnFriendRowList =
                                  snapshot.data!;
                              final columnFriendRow =
                                  columnFriendRowList.isNotEmpty
                                      ? columnFriendRowList.first
                                      : null;
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        3.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.safePop();
                                      },
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.arrow_back_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'EditUser',
                                          queryParameters: {
                                            'idUser': serializeParam(
                                              currentUserUid,
                                              ParamType.String,
                                            ),
                                            'idFriend': serializeParam(
                                              columnFriendRow?.idFriends,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              columnFriendRow?.name,
                                              '1',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Text(
                                            'last seen recently',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        7.0, 0.0, 7.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.network(
                                                columnFriendRow.avt!,
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: columnFriendRow.avt!,
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: columnFriendRow!.avt!,
                                        transitionOnUserGestures: true,
                                        child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            columnFriendRow.avt!,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<List<Message>>(
                        stream: _messagesStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final messages = [];
                            for (var item in snapshot.data!) {
                              if (currentUser!.uid! == item.profileId &&
                                      widget.idChat == item.idChat ||
                                  currentUser!.uid! == item.idChat &&
                                      widget.idChat == item.profileId)
                                messages.add(item);
                            }
                            print(messages.length);
                            return messages.isEmpty
                                ? const Center(
                                    child:
                                        Text('Start your conversation now :)'),
                                  )
                                //next step!
                                : ListView.builder(
                                    reverse: true,
                                    itemCount: messages.length,
                                    itemBuilder: (context, index) {
                                      final message = messages[index];
                                      _loadProfileCache(message.profileId);
                                      if (index == 0)
                                        return _ChatBubble(
                                          message: message,
                                          profile:
                                              _profileCache[message.profileId],
                                          isPadding: 8,
                                        );
                                      else
                                        return _ChatBubble(
                                          message: message,
                                          profile:
                                              _profileCache[message.profileId],
                                          isPadding: 0,
                                        );
                                    });
                          } else {
                            return Center(
                                child: CircularProgressIndicator(
                                    color: Colors.blue[300]));
                          }
                        }),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 1.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 2.0,
                            sigmaY: 2.0,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 0.0, 0.0, 0.0),
                                      child: TextFormField(
                                        maxLines: 3,
                                        minLines: 1,
                                        controller: _model.textController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          hintText: 'Start typing',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    Icons.send,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    final text = _model.textController.text;

                                    if (text.isEmpty) {
                                      return;
                                    }
                                    _model.textController!.clear();
                                    try {
                                      await SupaFlow.client
                                          .from('messages')
                                          .insert({
                                        'profile_id': currentUser!.uid,
                                        'content': text,
                                        'id_chat': widget.idChat
                                      });
                                    } on PostgrestException catch (error) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text('${error.message}'),
                                        backgroundColor: Colors.blueAccent[300],
                                      ));
                                    } catch (_) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text('$_'),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({
    Key? key,
    required this.message,
    required this.profile,
    required this.isPadding,
  }) : super(key: key);
  final double isPadding;
  final Message message;
  final Profile? profile;

  @override
  Widget build(BuildContext context) {
    return message.isMine == true
        ? Container(
            margin: EdgeInsets.only(bottom: isPadding),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 15.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width * 0.4,
                          minWidth: MediaQuery.sizeOf(context).width * 0.1),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Text(
                                      // overflow: TextOverflow.ellipsis,
                                      '${message.content}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  format(message.createdAt, locale: 'en_short'),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
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
        : Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 15.0, isPadding),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(13.0, 0.0, 7.0, 0.0),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      shape: BoxShape.circle,
                    ),
                    child: profile == null
                        ? CircularProgressIndicator()
                        : Image.network(
                            profile!.avt,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width * 0.4,
                      minWidth: MediaQuery.sizeOf(context).width * 0.1),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Wrap(
                          spacing: 0.0,
                          runSpacing: 0.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Text(
                              '${message.content}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              format(message.createdAt, locale: 'en_short'),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
