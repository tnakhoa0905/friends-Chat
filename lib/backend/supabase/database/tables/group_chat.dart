import '../database.dart';

class GroupChatTable extends SupabaseTable<GroupChatRow> {
  @override
  String get tableName => 'group_chat';

  @override
  GroupChatRow createRow(Map<String, dynamic> data) => GroupChatRow(data);
}

class GroupChatRow extends SupabaseDataRow {
  GroupChatRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GroupChatTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get avt => getField<String>('avt');
  set avt(String? value) => setField<String>('avt', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool? get isGroup => getField<bool>('is_group');
  set isGroup(bool? value) => setField<bool>('is_group', value);
}
