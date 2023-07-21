import '../database.dart';

class OrderTable extends SupabaseTable<OrderRow> {
  @override
  String get tableName => 'order';

  @override
  OrderRow createRow(Map<String, dynamic> data) => OrderRow(data);
}

class OrderRow extends SupabaseDataRow {
  OrderRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrderTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get idUser => getField<String>('id_user');
  set idUser(String? value) => setField<String>('id_user', value);

  int? get idRoom => getField<int>('id_room');
  set idRoom(int? value) => setField<int>('id_room', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  DateTime? get createAt => getField<DateTime>('create_at');
  set createAt(DateTime? value) => setField<DateTime>('create_at', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);
}
