import '../database.dart';

class MessageGroupTable extends SupabaseTable<MessageGroupRow> {
  @override
  String get tableName => 'messageGroupDetail';

  @override
  MessageGroupRow createRow(Map<String, dynamic> data) => MessageGroupRow(data);
}

class MessageGroupRow extends SupabaseDataRow {
  MessageGroupRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MessageGroupTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get roomId => getField<int>('room_id');
  set roomId(int? value) => setField<int>('room_id', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
