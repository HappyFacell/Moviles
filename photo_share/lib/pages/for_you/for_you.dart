import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:photo_share/pages/for_you/item_public.dart';


class FotosForYou extends StatelessWidget {
  const FotosForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return FirestoreListView(
      query: FirebaseFirestore.instance
          .collection('fshare')
          .where('public', isEqualTo: true),
      itemBuilder:
          (BuildContext context, QueryDocumentSnapshot<Map<String, dynamic>> document) {
        return PublicItem(publicData: document.data());
      },
    );
  }
}
