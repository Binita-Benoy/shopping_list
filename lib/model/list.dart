final String tableLists = 'lists';
class ListFields{
  static final String id='_id';
  static final String number='number';
  static final String item='item';
}
class List{
  final int? id;
  final int number;
  final String item;
  const List({
    this.id,
    required this.number,
    required this.item,
  });
  List copy({
    int? id,
    String? item,
    int? number,
  })=>
  List(
    id: id ?? this.id,
    item:item ?? this.item,
    number:number?? this.number,
  );
  Map<String,Object?>toJson()=>{
    ListFields.id:id,
    ListFields.item:item,
    ListFields.number:number,
  };
}