part of 'cinema_bloc.dart';

@immutable
//--State--//
class CinemaState {
  final String nameMovie;
  final String imageMovie;
  final String date;
  final String time;
  final List<String> selectedSeats;

  //--CinemaState--//
  CinemaState(
      {this.nameMovie = '',
      this.imageMovie = '',
      this.date = '0', //ngay
      this.time = '00', //thoi-gian
      List<String>? selectedSeats})
      : this.selectedSeats = selectedSeats ?? [];

  //--Cinema-Copy--//
  CinemaState copyWith(
          {String? date,
          String? time,
          List<String>? selectedSeats,
          String? nameMovie,
          String? imageMovie}) =>
      CinemaState(
          nameMovie: nameMovie ?? this.nameMovie,
          imageMovie: imageMovie ?? this.imageMovie,
          date: date ?? this.date,
          time: time ?? this.time,
          selectedSeats: selectedSeats ?? this.selectedSeats);
}
