import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../DataModal/user_model.dart';

final profileProvider = FutureProvider<UserModel>((ref) async {
  final doc = await FirebaseFirestore.instance
      .collection('profile')
      .doc('main')
      .get();

  return UserModel.fromMap(doc.data() ?? {});
});
