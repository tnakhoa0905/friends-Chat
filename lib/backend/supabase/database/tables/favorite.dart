import '../database.dart';

class FavoriteTable extends SupabaseTable<FavoriteRow> {
  @override
  String get tableName => 'favorite';

  @override
  FavoriteRow createRow(Map<String, dynamic> data) => FavoriteRow(data);
}

class FavoriteRow extends SupabaseDataRow {
  FavoriteRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FavoriteTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get idRoom => getField<int>('id_room');
  set idRoom(int? value) => setField<int>('id_room', value);

  String? get idUser => getField<String>('id_user');
  set idUser(String? value) => setField<String>('id_user', value);
}
