part of 'pending_bloc_bloc.dart';

abstract class PendingBlocEvent extends Equatable {
  const PendingBlocEvent();

  @override
  List<Object> get props => [];
}

class GetAllMyDisabledFotosEvent extends PendingBlocEvent {}
