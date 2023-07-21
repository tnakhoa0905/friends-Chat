import '../database.dart';

class UserTable extends SupabaseTable<UserRow> {
  @override
  String get tableName => 'user';

  @override
  UserRow createRow(Map<String, dynamic> data) => UserRow(data);
}

class UserRow extends SupabaseDataRow {
  UserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get avt => getField<String>('avt');
  set avt(String? value) => setField<String>('avt', value);

  bool? get isActive => getField<bool>('isActive');
  set isActive(bool? value) => setField<bool>('isActive', value);

  int? get role => getField<int>('role');
  set role(int? value) => setField<int>('role', value);
}
