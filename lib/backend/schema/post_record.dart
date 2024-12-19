import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostRecord extends FirestoreRecord {
  PostRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "picture" field.
  String? _picture;
  String get picture => _picture ?? '';
  bool hasPicture() => _picture != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _picture = snapshotData['picture'] as String?;
    _creator = snapshotData['creator'] as DocumentReference?;
    _content = snapshotData['content'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post');

  static Stream<PostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostRecord.fromSnapshot(s));

  static Future<PostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostRecord.fromSnapshot(s));

  static PostRecord fromSnapshot(DocumentSnapshot snapshot) => PostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostRecordData({
  DateTime? date,
  String? title,
  String? picture,
  DocumentReference? creator,
  String? content,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'title': title,
      'picture': picture,
      'creator': creator,
      'content': content,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostRecordDocumentEquality implements Equality<PostRecord> {
  const PostRecordDocumentEquality();

  @override
  bool equals(PostRecord? e1, PostRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.title == e2?.title &&
        e1?.picture == e2?.picture &&
        e1?.creator == e2?.creator &&
        e1?.content == e2?.content;
  }

  @override
  int hash(PostRecord? e) => const ListEquality()
      .hash([e?.date, e?.title, e?.picture, e?.creator, e?.content]);

  @override
  bool isValidKey(Object? o) => o is PostRecord;
}
