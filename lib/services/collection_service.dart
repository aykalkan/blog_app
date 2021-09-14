import 'package:cloud_firestore/cloud_firestore.dart';

enum Collection { users, posts, categories }

class CollectionService {
  CollectionService(Collection collection) {
    final collectionPath =
        collection.toString().substring("Collection".length + 1);

    _collection = FirebaseFirestore.instance.collection(collectionPath);
  }
  late CollectionReference _collection;

  get referance => _collection;

  /// (Map<String, dynami> data) => New collection document with auto id
  /// Returns newly created DocumentReferance
  Future<DocumentReference> add(
    Map<String, dynamic> data,
  ) async {
    data["createdAt"] = FieldValue.serverTimestamp();
    return await _collection.add(data);
  }

  Future<DocumentReference> addWithId(
    String id,
    Map<String, dynamic> data,
  ) async {
    final documentReference = _collection.doc(id);
    await documentReference.set(data);

    return documentReference;
  }

  Future<QuerySnapshot> find(
    String fieldName,
    dynamic value,
  ) async {
    QuerySnapshot snapshot =
        await _collection.where(fieldName, isEqualTo: value).get();

    if (snapshot.docs.isEmpty)
      throw FirebaseException(
        plugin: "collection-service",
        message: "not-found",
      );
    return snapshot;
  }

  Future<DocumentSnapshot> findWithId(
    String id,
  ) async {
    final snapshot = await find("__name__", id);

    if (snapshot.docs.isEmpty)
      throw FirebaseException(
        plugin: "collection-service",
        message: "not-found",
      );
    return snapshot.docs.first;
  }

  Stream<QuerySnapshot<Object?>> getDocsStream() {
    return referance.snapshots();
  }

  Future<void> delete(String id) async {
    final document = await findWithId(id);

    document.reference.delete();
  }
}
