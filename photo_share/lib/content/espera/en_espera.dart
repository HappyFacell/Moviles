import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

import '../foru/item_public.dart';
import 'bloc/pending_bloc.dart';


class EnEspera extends StatelessWidget {
  const EnEspera({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PendingBloc, PendingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is PendingFotosLoadingState) {
          return ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return YoutubeShimmer();
            },
          );
        } else if (state is PendingFotosEmptyState) {
          return Center(child: Text("No hay publicaciones"));
        } else if (state is PendingFotosSuccessState) {
          return ListView.builder(
            itemCount: state.myDisabledData.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemPublic(publicFData: state.myDisabledData[index]);
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
