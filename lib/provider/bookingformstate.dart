import 'package:flutter_music_animation_effect/model/event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingFormState {
  final String selectedTicketType;
  final int selectedSeats;
  final String selectedRow;
  final int startingSeat;

  BookingFormState({
    this.selectedTicketType = 'Regular',
    this.selectedSeats = 1,
    this.selectedRow = 'A',
    this.startingSeat = 1,
  });

  BookingFormState copyWith({
    String? selectedTicketType,
    int? selectedSeats,
    String? selectedRow,
    int? startingSeat,
  }) {
    return BookingFormState(
      selectedTicketType: selectedTicketType ?? this.selectedTicketType,
      selectedSeats: selectedSeats ?? this.selectedSeats,
      selectedRow: selectedRow ?? this.selectedRow,
      startingSeat: startingSeat ?? this.startingSeat,
    );
  }
}

class BookingFormNotifier extends StateNotifier<BookingFormState> {
  BookingFormNotifier() : super(BookingFormState());

  void updateTicketType(String ticketType) {
    state = state.copyWith(selectedTicketType: ticketType);
  }

  void updateSeats(int seats) {
    state = state.copyWith(selectedSeats: seats);
  }

  void updateRow(String row) {
    state = state.copyWith(selectedRow: row);
  }

  void updateStartingSeat(int startingSeat) {
    state = state.copyWith(startingSeat: startingSeat);
  }

  void incrementSeats() {
    if (state.selectedSeats < 10) {
      state = state.copyWith(selectedSeats: state.selectedSeats + 1);
    }
  }

  void decrementSeats() {
    if (state.selectedSeats > 1) {
      state = state.copyWith(selectedSeats: state.selectedSeats - 1);
    }
  }

  void incrementStartingSeat() {
    if (state.startingSeat < 50) {
      state = state.copyWith(startingSeat: state.startingSeat + 1);
    }
  }

  void decrementStartingSeat() {
    if (state.startingSeat > 1) {
      state = state.copyWith(startingSeat: state.startingSeat - 1);
    }
  }

  double getTicketPrice(Event event) {
    switch (state.selectedTicketType) {
      case 'VIP':
        return 120.0;
      case 'Standing':
        return 35.0;
      default:
        return event.price;
    }
  }
}

final bookingFormProvider =
    StateNotifierProvider<BookingFormNotifier, BookingFormState>((ref) {
      return BookingFormNotifier();
    });

// Bottom navigation state provider
final bottomNavigationProvider = StateProvider<int>((ref) => 0);
