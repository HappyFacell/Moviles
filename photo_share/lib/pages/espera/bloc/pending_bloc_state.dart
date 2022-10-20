part of 'pending_bloc_bloc.dart';

abstract class PendingBlocState extends Equatable {
  const PendingBlocState();

  @override
  List<Object> get props => [];
}

class PendingBlocInitial extends PendingBlocState {}

class PendingFotosSuccessState extends PendingBlocState {
  // lista de elementos de firebase "fshare collection"
  final List<Map<String, dynamic>> myDisabledData;
  const PendingFotosSuccessState({required this.myDisabledData});
  @override
  List<Object> get props => [myDisabledData];
}

class PendingFotosErrorState extends PendingBlocState {}

class PendingFotosEmptyState extends PendingBlocState {}

class PendingFotosLoadingState extends PendingBlocState {}
