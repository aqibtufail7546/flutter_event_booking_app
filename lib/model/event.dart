class Event {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final DateTime date;
  final String time;
  final String venue;
  final double price;
  final String category;
  final bool isFeatured;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.time,
    required this.venue,
    required this.price,
    required this.category,
    this.isFeatured = false,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'imageUrl': imageUrl,
    'date': date.toIso8601String(),
    'time': time,
    'venue': venue,
    'price': price,
    'category': category,
    'isFeatured': isFeatured,
  };

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    imageUrl: json['imageUrl'],
    date: DateTime.parse(json['date']),
    time: json['time'],
    venue: json['venue'],
    price: json['price'].toDouble(),
    category: json['category'],
    isFeatured: json['isFeatured'] ?? false,
  );
}
