import 'dart:convert';

import 'package:flutter_music_animation_effect/model/event.dart';
import 'package:flutter_music_animation_effect/model/ticket.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicketNotifier extends StateNotifier<List<Ticket>> {
  TicketNotifier() : super([]) {
    _loadTickets();
  }

  Future<void> _loadTickets() async {
    final prefs = await SharedPreferences.getInstance();
    final ticketsJson = prefs.getStringList('tickets') ?? [];
    state =
        ticketsJson.map((json) => Ticket.fromJson(jsonDecode(json))).toList();
  }

  Future<void> bookTicket(Event event) async {
    final ticket = Ticket(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      event: event,
      bookingDate: DateTime.now(),
      seatNumber: '4',
      row: 'Row A',
    );

    state = [...state, ticket];

    final prefs = await SharedPreferences.getInstance();
    final ticketsJson =
        state.map((ticket) => jsonEncode(ticket.toJson())).toList();
    await prefs.setStringList('tickets', ticketsJson);
  }
}
