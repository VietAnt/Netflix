part of 'cinema_bloc.dart';

@immutable
abstract class CinemaEvent {}

//--Sukien chon Flim--//
class OnSelectMovieEvent extends CinemaEvent {
  final String name;
  final String image;

  OnSelectMovieEvent(this.name, this.image);
}

//--Sukien-Ngay--//
class OnSelectedDateEvent extends CinemaEvent {
  final String date;

  OnSelectedDateEvent(this.date);
}

//--Sukien-ThoiGian--//
class OnSelectedTimeEvent extends CinemaEvent {
  final String time;

  OnSelectedTimeEvent(this.time);
}

//--Sukien--Chon ghe--//
class OnSelectdSeatsEvent extends CinemaEvent {
  final String selectedSeats;

  OnSelectdSeatsEvent(this.selectedSeats);
}
