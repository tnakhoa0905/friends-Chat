import '../database.dart';

class BalanceHistoryTable extends SupabaseTable<BalanceHistoryRow> {
  @override
  String get tableName => 'balanceHistory';

  @override
  BalanceHistoryRow createRow(Map<String, dynamic> data) =>
      BalanceHistoryRow(data);
}

class BalanceHistoryRow extends SupabaseDataRow {
  BalanceHistoryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BalanceHistoryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  String? get note => getField<String>('note');
  set note(String? value) => setField<String>('note', value);

  String? get userIdSend => getField<String>('user_id_send');
  set userIdSend(String? value) => setField<String>('user_id_send', value);
}
