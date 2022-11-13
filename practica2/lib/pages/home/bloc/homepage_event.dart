part of 'homepage_bloc.dart';

@immutable
abstract class HomepageEvent extends Equatable {
  const HomepageEvent();

  @override
  List<Object> get props => [];
}

class HomepageRecordUpdateEvent extends HomepageEvent {}
