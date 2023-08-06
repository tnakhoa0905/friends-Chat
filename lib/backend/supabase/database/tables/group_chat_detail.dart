import '../database.dart';

class GroupChatDetailTable extends SupabaseTable<GroupChatDetailRow> {
  @override
  String get tableName => 'group_chat_detail';

  @override
  GroupChatDetailRow createRow(Map<String, dynamic> data) =>
      GroupChatDetailRow(data);
}

class GroupChatDetailRow extends SupabaseDataRow {
  GroupChatDetailRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GroupChatDetailTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get idGroupChat => getField<int>('id_group_chat');
  set idGroupChat(int? value) => setField<int>('id_group_chat', value);
}
