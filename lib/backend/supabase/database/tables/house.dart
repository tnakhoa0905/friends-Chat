import '../database.dart';

class HouseTable extends SupabaseTable<HouseRow> {
  @override
  String get tableName => 'house';

  @override
  HouseRow createRow(Map<String, dynamic> data) => HouseRow(data);
}

class HouseRow extends SupabaseDataRow {
  HouseRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HouseTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  int? get price => getField<int>('price');
  set price(int? value) => setField<int>('price', value);

  int? get rooms => getField<int>('rooms');
  set rooms(int? value) => setField<int>('rooms', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  List<String> get garlery => getListField<String>('garlery');
  set garlery(List<String>? value) => setListField<String>('garlery', value);

  String? get avt => getField<String>('avt');
  set avt(String? value) => setField<String>('avt', value);
}
