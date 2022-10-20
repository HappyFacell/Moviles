import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'pending_bloc_event.dart';
part 'pending_bloc_state.dart';

class PendingBlocBloc extends Bloc<PendingBlocEvent, PendingBlocState> {
  PendingBlocBloc() : super(PendingBlocInitial()) {
    on<GetAllMyDisabledFotosEvent>(_getMyDisabledContent);
  }

  Future<FutureOr<void>> _getMyDisabledContent(event, emit) async {
    emit(PendingFotosLoadingState());

    try {
      var queryUser = await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid);

      var docsRef = await queryUser.get();
      var listIds = docsRef.data()?['fotosListId'];

      var queryFotos =
          await FirebaseFirestore.instance.collection('fshare').get();

      var myDisabledContentList = queryFotos.docs
          .where((doc) =>
              listIds.contains(doc.id) && doc.data()['public'] == false)
          .map((doc) => doc.data().cast<String, dynamic>())
          .toList();

      emit(PendingFotosSuccessState(myDisabledData: myDisabledContentList));
    } catch (e) {
      emit(PendingFotosErrorState());
      emit(PendingFotosEmptyState());
    }
  }
}
