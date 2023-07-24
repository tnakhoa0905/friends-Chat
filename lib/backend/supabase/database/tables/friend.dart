import '../database.dart';

class FriendTable extends SupabaseTable<FriendRow> {
  @override
  String get tableName => 'friend';

  @override
  FriendRow createRow(Map<String, dynamic> data) => FriendRow(data);
}

class FriendRow extends SupabaseDataRow {
  FriendRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FriendTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get idUser => getField<String>('id_user');
  set idUser(String? value) => setField<String>('id_user', value);

  String? get idFriends => getField<String>('id_friends');
  set idFriends(String? value) => setField<String>('id_friends', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get avt => getField<String>('avt');
  set avt(String? value) => setField<String>('avt', value);
}
