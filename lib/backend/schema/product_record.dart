import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductRecord extends FirestoreRecord {
  ProductRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "isSold" field.
  bool? _isSold;
  bool get isSold => _isSold ?? false;
  bool hasIsSold() => _isSold != null;

  // "buyer" field.
  DocumentReference? _buyer;
  DocumentReference? get buyer => _buyer;
  bool hasBuyer() => _buyer != null;

  // "picture" field.
  String? _picture;
  String get picture => _picture ?? '';
  bool hasPicture() => _picture != null;

  // "nbrLikes" field.
  int? _nbrLikes;
  int get nbrLikes => _nbrLikes ?? 0;
  bool hasNbrLikes() => _nbrLikes != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _owner = snapshotData['owner'] as DocumentReference?;
    _isSold = snapshotData['isSold'] as bool?;
    _buyer = snapshotData['buyer'] as DocumentReference?;
    _picture = snapshotData['picture'] as String?;
    _nbrLikes = castToType<int>(snapshotData['nbrLikes']);
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product');

  static Stream<ProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductRecord.fromSnapshot(s));

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductRecord.fromSnapshot(s));

  static ProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductRecordData({
  String? title,
  String? description,
  double? price,
  DocumentReference? owner,
  bool? isSold,
  DocumentReference? buyer,
  String? picture,
  int? nbrLikes,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'price': price,
      'owner': owner,
      'isSold': isSold,
      'buyer': buyer,
      'picture': picture,
      'nbrLikes': nbrLikes,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductRecordDocumentEquality implements Equality<ProductRecord> {
  const ProductRecordDocumentEquality();

  @override
  bool equals(ProductRecord? e1, ProductRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.owner == e2?.owner &&
        e1?.isSold == e2?.isSold &&
        e1?.buyer == e2?.buyer &&
        e1?.picture == e2?.picture &&
        e1?.nbrLikes == e2?.nbrLikes &&
        e1?.date == e2?.date;
  }

  @override
  int hash(ProductRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.price,
        e?.owner,
        e?.isSold,
        e?.buyer,
        e?.picture,
        e?.nbrLikes,
        e?.date
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductRecord;
}
