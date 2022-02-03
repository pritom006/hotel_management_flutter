class MyBookingRoom {
  final String? roomId;
  final String? paymentMethod;
  final String? inDate;
  final String? outDate;
  final double? charge;
  final double? amount;
  final int? day;
  final int? member;

  final Map? bed;
  final Map? window;
  final Map? floor;
  final Map? table;
  final Map? ac;
  final Map? balcony;
  MyBookingRoom({
    this.roomId,
    this.paymentMethod,
    this.inDate,
    this.outDate,
    this.charge,
    this.amount,
    this.day,
    this.member,
    this.bed,
    this.window,
    this.floor,
    this.balcony,
    this.table,
    this.ac,
  });
}
