import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventReservationRecord extends FirestoreRecord {
  EventReservationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "nbrSeats" field.
  int? _nbrSeats;
  int get nbrSeats => _nbrSeats ?? 0;
  bool hasNbrSeats() => _nbrSeats != null;

  // "totalAmount" field.
  double? _totalAmount;
  double get totalAmount => _totalAmount ?? 0.0;
  bool hasTotalAmount() => _totalAmount != null;

  // "isPayed" field.
  bool? _isPayed;
  bool get isPayed => _isPayed ?? false;
  bool hasIsPayed() => _isPayed != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _nbrSeats = castToType<int>(snapshotData['nbrSeats']);
    _totalAmount = castToType<double>(snapshotData['totalAmount']);
    _isPayed = snapshotData['isPayed'] as bool?;
    _event = snapshotData['event'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('EventReservation');

  static Stream<EventReservationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventReservationRecord.fromSnapshot(s));

  static Future<EventReservationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EventReservationRecord.fromSnapshot(s));

  static EventReservationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventReservationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventReservationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventReservationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventReservationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventReservationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventReservationRecordData({
  DocumentReference? user,
  DateTime? date,
  int? nbrSeats,
  double? totalAmount,
  bool? isPayed,
  DocumentReference? event,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'date': date,
      'nbrSeats': nbrSeats,
      'totalAmount': totalAmount,
      'isPayed': isPayed,
      'event': event,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventReservationRecordDocumentEquality
    implements Equality<EventReservationRecord> {
  const EventReservationRecordDocumentEquality();

  @override
  bool equals(EventReservationRecord? e1, EventReservationRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.date == e2?.date &&
        e1?.nbrSeats == e2?.nbrSeats &&
        e1?.totalAmount == e2?.totalAmount &&
        e1?.isPayed == e2?.isPayed &&
        e1?.event == e2?.event &&
        e1?.status == e2?.status;
  }

  @override
  int hash(EventReservationRecord? e) => const ListEquality().hash([
        e?.user,
        e?.date,
        e?.nbrSeats,
        e?.totalAmount,
        e?.isPayed,
        e?.event,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is EventReservationRecord;
}
