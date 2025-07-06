import 'dart:convert';

import 'package:flutter_music_animation_effect/model/event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteNotifier extends StateNotifier<List<Event>> {
  FavoriteNotifier() : super([]) {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList('favorites') ?? [];
    state =
        favoritesJson.map((json) => Event.fromJson(jsonDecode(json))).toList();
  }

  Future<void> toggleFavorite(Event event) async {
    final isFavorite = state.any((e) => e.id == event.id);

    if (isFavorite) {
      state = state.where((e) => e.id != event.id).toList();
    } else {
      state = [...state, event];
    }

    final prefs = await SharedPreferences.getInstance();
    final favoritesJson =
        state.map((event) => jsonEncode(event.toJson())).toList();
    await prefs.setStringList('favorites', favoritesJson);
  }

  bool isFavorite(Event event) {
    return state.any((e) => e.id == event.id);
  }
}
