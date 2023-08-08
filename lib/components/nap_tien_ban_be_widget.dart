import 'dart:math';

import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:chat_app/components/tai_khoan_khong_du_widget.dart';

import '../backend/supabase/database/tables/balance_history.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nap_tien_ban_be_model.dart';
export 'nap_tien_ban_be_model.dart';

class NapTienBanBeWidget extends StatefulWidget {
  const NapTienBanBeWidget(
      {Key? key,
      required this.idSend,
      required this.soDu,
      required this.tongTien,
      required this.isSend,
      required this.isAdmin})
      : super(key: key);

  final String idSend;
  final double soDu;
  final bool isAdmin;
  final double tongTien;
  final bool isSend;

  @override
  _NapTienBanBeWidgetState createState() => _NapTienBanBeWidgetState();
}

class _NapTienBanBeWidgetState extends State<NapTienBanBeWidget> {
  late NapTienBanBeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NapTienBanBeModel());

    _model.noteController ??= TextEditingController();
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
      child: Material(
        color: Colors.transparent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.7,
          height: 376.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Text(
                        widget.isAdmin == false ? 'Nạp tiền' : 'Trừ tiền',
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Color(0x0023A8FF),
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: Color(0x00616161),
                      icon: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
                indent: 12.0,
                endIndent: 12.0,
                color: FlutterFlowTheme.of(context).accent4,
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: FlutterFlowDropDown<double>(
                    controller: _model.moneyValueController ??=
                        FormFieldController<double>(
                      _model.moneyValue ??= 50000,
                    ),
                    options: [
                      50000,
                      100000,
                      150000,
                      200000,
                      250000,
                      300000,
                      350000,
                      400000,
                      450000,
                      500000,
                      550000,
                      600000,
                      650000,
                      700000,
                      750000,
                      800000,
                      850000,
                      900000,
                      950000,
                      1000000
                    ],
                    optionLabels: [
                      '50000',
                      '100000',
                      '150000',
                      '200000',
                      '250000',
                      '300000',
                      '350000',
                      '400000',
                      '450000',
                      '500000',
                      '550000',
                      '600000',
                      '650000',
                      '700000',
                      '750000',
                      '800000',
                      '850000',
                      '900000',
                      '950000',
                      '1000000'
                    ],
                    onChanged: (val) => setState(() => _model.moneyValue = val),
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 40.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: 'chọn số tiền',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 15.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: Color(0xFFE0E3E7),
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: false,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.noteController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle: FlutterFlowTheme.of(context).bodySmall,
                      hintText: 'Enter note...',
                      hintStyle: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE0E3E7),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryText,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 24.0, 20.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    maxLines: 10,
                    minLines: 6,
                    validator:
                        _model.noteControllerValidator.asValidator(context),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (widget.isAdmin == true) {
                        print('1');
                        if (widget.isSend == true) {
                          print('2');
                          await BalanceHistoryTable().insert({
                            'user_id': currentUserUid,
                            'amount': _model.moneyValue! * -1,
                            'user_id_send': widget.idSend,
                            'note': _model.noteController.text,
                          });
                        } else {
                          await BalanceHistoryTable().insert({
                            'user_id': currentUserUid,
                            'amount': _model.moneyValue! * -1,
                            'user_id_send': widget.idSend,
                            'note': _model.noteController.text,
                          });
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Giao dịch thành công...',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                          ),
                        );
                        context.safePop();
                      } else {
                        print('user');
                        var result = await SupaFlow.client
                            .rpc('transaction_money', params: {
                          'id_input': currentUserUid,
                          'amount_input': _model.moneyValue! * -1,
                          'id_send': widget.idSend,
                          'note_input': _model.noteController.text,
                        });

                        if (result == true) {
                          print('đc rồi');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Chuyển tiền thành công...',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ),
                          );
                          context.safePop();
                        } else {
                          print('thiếu tiền nhé');
                          await showAlignedDialog(
                            context: context,
                            isGlobal: true,
                            avoidOverflow: false,
                            targetAnchor: AlignmentDirectional(0, 0)
                                .resolve(Directionality.of(context)),
                            followerAnchor: AlignmentDirectional(0, 0)
                                .resolve(Directionality.of(context)),
                            builder: (dialogContext) {
                              return Material(
                                color: Colors.transparent,
                                child: TaiKhoanKhongDuWidget(),
                              );
                            },
                          ).then((value) => setState(() {}));
                        }
                      }
                    },
                    text: widget.isSend == true ? 'Nạp tiền' : 'Trừ tiền',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter',
                                color: Colors.white,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<double> checkMoney(double tongTien) async {
    List<BalanceHistoryRow> listViewBalanceHistoryRowList = [];
    List<BalanceHistoryRow> listSnapshot =
        await BalanceHistoryTable().queryRows(queryFn: (q) => q);

    double sum = 0;
    for (var item in listSnapshot) {
      if (item.userId!.contains(currentUserUid) ||
          item.userIdSend!.contains(currentUserUid)) {
        listViewBalanceHistoryRowList.add(item);
      }
    }
    for (var item in listViewBalanceHistoryRowList) {
      if (item.userId!.contains(currentUserUid)) {
        sum += item.amount!;
      } else
        sum -= item.amount!;
    }
    double soDu = tongTien - sum;
    return soDu;
  }
}
