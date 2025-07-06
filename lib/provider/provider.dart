import 'package:flutter_music_animation_effect/model/event.dart';
import 'package:flutter_music_animation_effect/model/ticket.dart' show Ticket;
import 'package:flutter_music_animation_effect/provider/favoritenotifier.dart';
import 'package:flutter_music_animation_effect/provider/ticketnotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventProvider = StateNotifierProvider<EventNotifier, List<Event>>((ref) {
  return EventNotifier();
});

class EventNotifier extends StateNotifier<List<Event>> {
  EventNotifier() : super([]) {
    _loadEvents();
  }

  void _loadEvents() {
    state = [
      Event(
        id: '1',
        title: 'The Weekend',
        description:
            'Experience an unforgettable night with The Weekend live in concert. Get ready for incredible music and amazing atmosphere.',
        imageUrl:
            'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=400',
        date: DateTime(2024, 12, 15),
        time: '8:00 PM',
        venue: 'Madison Square Garden',
        price: 89.99,
        category: 'Concert',
        isFeatured: true,
      ),
      Event(
        id: '2',
        title: 'Midnight Impact Music',
        description:
            'Join us for an electrifying musical experience that will keep you dancing all night long.',
        imageUrl:
            'https://images.unsplash.com/photo-1501386761578-eac5c94b800a?w=400',
        date: DateTime(2024, 6, 8),
        time: '11:30 PM',
        venue: 'Impact Arena',
        price: 65.00,
        category: 'Music',
        isFeatured: true,
      ),
      Event(
        id: '3',
        title: 'Spring Festival',
        description:
            'Celebrate the arrival of spring with live music, food, and entertainment for the whole family.',
        imageUrl:
            'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?w=400',
        date: DateTime(2024, 3, 20),
        time: '2:00 PM',
        venue: 'Central Park',
        price: 25.00,
        category: 'Festival',
      ),
      Event(
        id: '1',
        title: 'The Weekend',
        description:
            'Experience an unforgettable night with The Weekend live in concert. Get ready for incredible music and amazing atmosphere.',
        imageUrl:
            'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=400',
        date: DateTime(2024, 12, 15),
        time: '8:00 PM',
        venue: 'Madison Square Garden',
        price: 89.99,
        category: 'Concert',
        isFeatured: true,
      ),
      Event(
        id: '2',
        title: 'Midnight Impact Music',
        description:
            'Join us for an electrifying musical experience that will keep you dancing all night long.',
        imageUrl:
            'https://images.unsplash.com/photo-1501386761578-eac5c94b800a?w=400',
        date: DateTime(2024, 6, 8),
        time: '11:30 PM',
        venue: 'Impact Arena',
        price: 65.00,
        category: 'Music',
        isFeatured: true,
      ),
      Event(
        id: '3',
        title: 'Spring Festival',
        description:
            'Celebrate the arrival of spring with live music, food, and entertainment for the whole family.',
        imageUrl:
            'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?w=400',
        date: DateTime(2024, 3, 20),
        time: '2:00 PM',
        venue: 'Central Park',
        price: 25.00,
        category: 'Festival',
      ),
      Event(
        id: '4',
        title: 'Taylor Swift Eras Tour',
        description:
            'The most anticipated tour of the year! Join Taylor Swift as she performs hits from every era of her career.',
        imageUrl:
            'https://images.unsplash.com/photo-1429514513361-8fa32282fd5f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y29uY2VydHxlbnwwfHwwfHx8MA%3D%3D',
        date: DateTime(2024, 8, 22),
        time: '7:30 PM',
        venue: 'Wembley Stadium',
        price: 125.00,
        category: 'Concert',
        isFeatured: true,
      ),
      Event(
        id: '5',
        title: 'Electronic Paradise',
        description:
            'Dive into the world of electronic music with top DJs from around the globe. Featuring stunning light shows and bass drops.',
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1681830630610-9f26c9729b75?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Y29uY2VydHxlbnwwfHwwfHx8MA%3D%3D',
        date: DateTime(2024, 7, 14),
        time: '10:00 PM',
        venue: 'Electric Factory',
        price: 75.00,
        category: 'Electronic',
        isFeatured: true,
      ),
      Event(
        id: '6',
        title: 'Jazz & Blues Night',
        description:
            'An intimate evening of soulful jazz and blues performances. Perfect for music lovers seeking a sophisticated experience.',
        imageUrl:
            'https://images.unsplash.com/photo-1468359601543-843bfaef291a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGNvbmNlcnR8ZW58MHx8MHx8fDA%3D',
        date: DateTime(2024, 9, 5),
        time: '8:30 PM',
        venue: 'Blue Note',
        price: 45.00,
        category: 'Jazz',
      ),
      Event(
        id: '7',
        title: 'Rock Revolution',
        description:
            'Get ready to rock! A high-energy concert featuring the best rock bands of the generation.',
        imageUrl:
            'https://images.unsplash.com/photo-1524368535928-5b5e00ddc76b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGNvbmNlcnR8ZW58MHx8MHx8fDA%3D',
        date: DateTime(2024, 10, 12),
        time: '7:00 PM',
        venue: 'Rock Arena',
        price: 95.00,
        category: 'Rock',
        isFeatured: true,
      ),
      Event(
        id: '8',
        title: 'Classical Symphony',
        description:
            'Experience the beauty of classical music with a full orchestra performing timeless masterpieces.',
        imageUrl:
            'https://images.unsplash.com/photo-1473396413399-6717ef7c4093?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzF8fGNvbmNlcnR8ZW58MHx8MHx8fDA%3D',
        date: DateTime(2024, 11, 3),
        time: '7:30 PM',
        venue: 'Symphony Hall',
        price: 80.00,
        category: 'Classical',
      ),
      Event(
        id: '9',
        title: 'Hip-Hop Legends',
        description:
            'The biggest names in hip-hop come together for one epic night. Don\'t miss this legendary lineup.',
        imageUrl:
            'https://images.unsplash.com/photo-1501527459-2d5409f8cf9f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzl8fGNvbmNlcnR8ZW58MHx8MHx8fDA%3D',
        date: DateTime(2024, 8, 30),
        time: '9:00 PM',
        venue: 'Metro Arena',
        price: 110.00,
        category: 'Hip-Hop',
        isFeatured: true,
      ),
      Event(
        id: '10',
        title: 'Country Music Festival',
        description:
            'A celebration of country music with multiple stages, food trucks, and authentic southern hospitality.',
        imageUrl:
            'https://images.unsplash.com/photo-1507676184212-d03ab07a01bf?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGNvbmNlcnR8ZW58MHx8MHx8fDA%3D',
        date: DateTime(2024, 6, 15),
        time: '12:00 PM',
        venue: 'Country Fields',
        price: 55.00,
        category: 'Country',
      ),
    ];
  }
}

final ticketProvider = StateNotifierProvider<TicketNotifier, List<Ticket>>((
  ref,
) {
  return TicketNotifier();
});
final favoriteProvider = StateNotifierProvider<FavoriteNotifier, List<Event>>((
  ref,
) {
  return FavoriteNotifier();
});
