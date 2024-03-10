import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebookclone/core/constants/firebaes_collection_names.dart';
import 'package:facebookclone/core/constants/firebase_field_names.dart';
import 'package:facebookclone/features/posts/models/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllPostsProvider = StreamProvider.autoDispose<Iterable<Post>>((ref) {
  final controller = StreamController<Iterable<Post>>();
  StreamSubscription<QuerySnapshot>? sub;

  sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionNames.posts)
      .orderBy(FirebaseFieldNames.datePublished, descending: true)
      .snapshots()
      .listen((snapshot) {
    final posts =
        snapshot.docs.map((postData) => Post.fromMap(postData.data()));

    // // Filter posts locally
    // final filteredPosts =
    //     posts.where((post) => post.postType == 'video').toList();
    // controller.sink.add(filteredPosts);

    // Filter out posts older than 30 days
    final filteredPosts = posts.where((post) {
      final tenDaysAgo = DateTime.now().subtract(const Duration(days: 10));
      return post.createdAt.isAfter(tenDaysAgo);
    }).toList();

    controller.sink.add(filteredPosts);

    // After 30 days, automatically cancel the subscription and close the stream
    Future.delayed(const Duration(days: 10), () {
      sub!.cancel();
      controller.close();
    });
  });

  return controller.stream;
});
