import 'package:chat_app/components/empty_list_widget.dart';
import 'package:chat_app/components/loading_widget.dart';
import 'package:chat_app/flutter_flow/flutter_flow_widgets.dart';

import '../backend/supabase/database/tables/group_chat.dart';
import '../backend/supabase/database/tables/group_chat_detail.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/message_preview_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: FutureBuilder<List<UserRow>>(
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
              List<UserRow> columnUserRowList = snapshot.data!;
              final columnUserRow =
                  columnUserRowList.isNotEmpty ? columnUserRowList.first : null;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [],
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16, 8.0, 16.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    columnUserRow!.avt!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Chats',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            // Generated code for this IconButton Widget...
                            FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: 20,
                              borderWidth: 1,
                              buttonSize: 40,
                              fillColor: Color(0x00616161),
                              icon: Icon(
                                Icons.edit_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              onPressed: () async {
                                context.pushNamed('CreateGroupChat');
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('addFriends');
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: TextFormField(
                          onTap: () async {
                            context.pushNamed('addFriends');
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                            hintText: 'Tìm kiếm bạn bè...',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                            prefixIcon: Icon(
                              Icons.search,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Lexend Deca',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                    // Generated code for this ListView Widget...
                    FutureBuilder<List<GroupChatDetailRow>>(
                      future: GroupChatDetailTable().queryRows(
                        queryFn: (q) => q.eq("user_id", currentUserUid),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          // return Center(
                          //   child: SizedBox(
                          //     width: 50,
                          //     height: 50,
                          //     child: CircularProgressIndicator(
                          //       valueColor: AlwaysStoppedAnimation<Color>(
                          //         FlutterFlowTheme.of(context).primary,
                          //       ),
                          //     ),
                          //   ),
                          // );
                          return Container();
                        }
                        List<GroupChatDetailRow>
                            listViewGroupChatDetailRowList = snapshot.data!;
                        if (listViewGroupChatDetailRowList.isEmpty) {
                          return EmptyListWidget();
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewGroupChatDetailRowList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewGroupChatDetailRow =
                                listViewGroupChatDetailRowList[listViewIndex];
                            return FutureBuilder<List<GroupChatRow>>(
                              future: GroupChatTable().querySingleRow(
                                queryFn: (q) => q.eq(
                                  'id',
                                  listViewGroupChatDetailRow.idGroupChat,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  // return Center(
                                  //   child: SizedBox(
                                  //     width: 50,
                                  //     height: 50,
                                  //     child: CircularProgressIndicator(
                                  //       valueColor:
                                  //           AlwaysStoppedAnimation<Color>(
                                  //         FlutterFlowTheme.of(context).primary,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // );
                                  return Container();
                                }
                                List<GroupChatRow>
                                    messagePreviewGroupChatRowList =
                                    snapshot.data!;
                                final messagePreviewGroupChatRow =
                                    messagePreviewGroupChatRowList.isNotEmpty
                                        ? messagePreviewGroupChatRowList.first
                                        : null;
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'audioChatDemo',
                                      queryParameters: {
                                        'idChat': serializeParam(
                                          listViewGroupChatDetailRow
                                              .idGroupChat,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: MessagePreviewWidget(
                                    key: Key(
                                        'Keyzcw_${listViewIndex}_of_${listViewGroupChatDetailRowList.length}'),
                                    messageTitle:
                                        messagePreviewGroupChatRow?.name,
                                    messageContent:
                                        'Let\'s reconnect Monday and talk about FlutterFlow!',
                                    messageImage:
                                        messagePreviewGroupChatRow?.avt,
                                    isUnread: true,
                                    messageTime: '3:49 PM',
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
