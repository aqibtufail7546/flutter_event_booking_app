class BookingData {
  final String name;
  final String email;
  final String phone;
  final String ticketType;
  final int seats;
  final String row;
  final int startingSeat;
  final double totalPrice;

  BookingData({
    required this.name,
    required this.email,
    required this.phone,
    required this.ticketType,
    required this.seats,
    required this.row,
    required this.startingSeat,
    required this.totalPrice,
  });
}
