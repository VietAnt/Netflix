import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cinema_event.dart';
part 'cinema_state.dart';

class CinemaBloc extends Bloc<CinemaEvent, CinemaState> {
  CinemaBloc() : super(CinemaState()) {
    on<OnSelectedDateEvent>(_onSelectedDate);
    on<OnSelectedTimeEvent>(_onSelectedTime);
    on<OnSelectdSeatsEvent>(_onSelectedSeats);
    on<OnSelectMovieEvent>(_onSelectedMovie);
  }

  //---Danh sach--Ghe--//
  List<String> seats = [];

  //--Su kien Ngay--//
  Future<void> _onSelectedDate(
      OnSelectedDateEvent event, Emitter<CinemaState> emit) async {
    emit(state.copyWith(date: event.date));
  }

  //--Su kien Thoi-Gian--//
  Future<void> _onSelectedTime(
      OnSelectedTimeEvent event, Emitter<CinemaState> emit) async {
    emit(state.copyWith(time: event.time));
  }

  //--Su kien Chon_Ghe--//
  Future<void> _onSelectedSeats(
      OnSelectdSeatsEvent event, Emitter<CinemaState> emit) async {
    if (seats.contains(event.selectedSeats)) {
      seats.remove(event.selectedSeats);
      emit(state.copyWith(selectedSeats: seats));
    } else {
      seats.add(event.selectedSeats);
      emit(state.copyWith(selectedSeats: seats));
    }
  }

  //--Su kien Chon_Film--//
  Future<void> _onSelectedMovie(
      OnSelectMovieEvent event, Emitter<CinemaState> emit) async {
    emit(state.copyWith(nameMovie: event.name, imageMovie: event.image));
  }
}
