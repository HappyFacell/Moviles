import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'pending_event.dart';
part 'pending_state.dart';

class PendingBloc extends Bloc<PendingEvent, PendingState> {
  PendingBloc() : super(PendingInitial()) {
    on<GetAllMyDisabledFotosEvent>(_getMyDisabledContent);
  }

  FutureOr<void> _getMyDisabledContent(event, emit) async {
    emit(PendingFotosLoadingState());
    try {
      // traernos el document con el id de mi usuario
      var queryUser = await FirebaseFirestore.instance
          .collection("user")
          .doc("${FirebaseAuth.instance.currentUser!.uid}");
      // sacar data del documento
      var docsRef = await queryUser.get();
      var listIds = docsRef.data()?["fotosListId"];

      // query para sacar docs de fshare
      var queryFotos =
          await FirebaseFirestore.instance.collection("fshare").get();

      // filtrar con Dart la info necesaria usando con referencia la lista de isd del user actual
      var myDisabledContentList = queryFotos.docs
          .where((doc) =>
              listIds.contains(doc.id) && doc.data()["public"] == false)
          .map((doc) => doc.data().cast<String, dynamic>())
          .toList();

      // lista de documentos filtrados del usuario con datos en espera
      emit(PendingFotosSuccessState(myDisabledData: myDisabledContentList));
    } catch (e) {
      emit(PendingFotosErrorState());
      emit(PendingFotosEmptyState());
    }
  }
}
