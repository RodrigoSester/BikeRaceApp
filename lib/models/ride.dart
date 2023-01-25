import 'dart:convert';

class RideModel {
  static List<Item> items = [];

  Item getById(int id) => items.firstWhere((element) => element.id == id);

  Item getByPosition(int position) => items[position];
}

class Item {
  final int id;
  final String title;
  final String description;
  final String location;
  final DateTime date;
  final String image;

  Item({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.date,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'date': date,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      location: map['location'],
      date: map['date'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, title: $title, description: $description, location: $location, date: $date, image: $image)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Item &&
        o.id == id &&
        o.title == title &&
        o.description == description &&
        o.location == location &&
        o.date == date &&
        o.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        location.hashCode ^
        date.hashCode ^
        image.hashCode;
  }
}
