
// Item item = Item(name: 'arsh', id: 1, favourite: false, );
// final name  = item.copyWith(name : 'prince');

class Item {
  final String name;
  final int id;
  final bool favourite;

  Item({required this.name, required this.id, required this.favourite});

  Item copyWith({
     String? name,
     int? id,
    bool? favourite
  }){
    return Item(
        name: name ?? this.name,
        id: id ?? this.id,
        favourite: favourite ?? this.favourite
    );
  }
}