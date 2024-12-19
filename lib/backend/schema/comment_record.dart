import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentRecord extends FirestoreRecord {
  CommentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "rate" field.
  int? _rate;
  int get rate => _rate ?? 0;
  bool hasRate() => _rate != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _rate = castToType<int>(snapshotData['rate']);
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('comment')
          : FirebaseFirestore.instance.collectionGroup('comment');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('comment').doc(id);

  static Stream<CommentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentRecord.fromSnapshot(s));

  static Future<CommentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentRecord.fromSnapshot(s));

  static CommentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentRecordData({
  DocumentReference? user,
  String? comment,
  int? rate,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'comment': comment,
      'rate': rate,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentRecordDocumentEquality implements Equality<CommentRecord> {
  const CommentRecordDocumentEquality();

  @override
  bool equals(CommentRecord? e1, CommentRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.comment == e2?.comment &&
        e1?.rate == e2?.rate &&
        e1?.date == e2?.date;
  }

  @override
  int hash(CommentRecord? e) =>
      const ListEquality().hash([e?.user, e?.comment, e?.rate, e?.date]);

  @override
  bool isValidKey(Object? o) => o is CommentRecord;
}
