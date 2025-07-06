import 'package:flutter_music_animation_effect/model/event.dart';

class Ticket {
  final String id;
  final Event event;
  final DateTime bookingDate;
  final String seatNumber;
  final String row;

  Ticket({
    required this.id,
    required this.event,
    required this.bookingDate,
    required this.seatNumber,
    required this.row,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'event': event.toJson(),
    'bookingDate': bookingDate.toIso8601String(),
    'seatNumber': seatNumber,
    'row': row,
  };

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
    id: json['id'],
    event: Event.fromJson(json['event']),
    bookingDate: DateTime.parse(json['bookingDate']),
    seatNumber: json['seatNumber'],
    row: json['row'],
  );
}
