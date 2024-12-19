import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventRecord extends FirestoreRecord {
  EventRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "DateEvent" field.
  DateTime? _dateEvent;
  DateTime? get dateEvent => _dateEvent;
  bool hasDateEvent() => _dateEvent != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "adresse" field.
  String? _adresse;
  String get adresse => _adresse ?? '';
  bool hasAdresse() => _adresse != null;

  // "nbrPlace" field.
  int? _nbrPlace;
  int get nbrPlace => _nbrPlace ?? 0;
  bool hasNbrPlace() => _nbrPlace != null;

  // "TicketPrice" field.
  double? _ticketPrice;
  double get ticketPrice => _ticketPrice ?? 0.0;
  bool hasTicketPrice() => _ticketPrice != null;

  // "picture" field.
  String? _picture;
  String get picture => _picture ?? '';
  bool hasPicture() => _picture != null;

  // "nbrAvailableSeats" field.
  int? _nbrAvailableSeats;
  int get nbrAvailableSeats => _nbrAvailableSeats ?? 0;
  bool hasNbrAvailableSeats() => _nbrAvailableSeats != null;

  void _initializeFields() {
    _dateEvent = snapshotData['DateEvent'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
    _titre = snapshotData['titre'] as String?;
    _description = snapshotData['description'] as String?;
    _adresse = snapshotData['adresse'] as String?;
    _nbrPlace = castToType<int>(snapshotData['nbrPlace']);
    _ticketPrice = castToType<double>(snapshotData['TicketPrice']);
    _picture = snapshotData['picture'] as String?;
    _nbrAvailableSeats = castToType<int>(snapshotData['nbrAvailableSeats']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Event');

  static Stream<EventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventRecord.fromSnapshot(s));

  static Future<EventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventRecord.fromSnapshot(s));

  static EventRecord fromSnapshot(DocumentSnapshot snapshot) => EventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventRecordData({
  DateTime? dateEvent,
  LatLng? location,
  String? titre,
  String? description,
  String? adresse,
  int? nbrPlace,
  double? ticketPrice,
  String? picture,
  int? nbrAvailableSeats,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'DateEvent': dateEvent,
      'location': location,
      'titre': titre,
      'description': description,
      'adresse': adresse,
      'nbrPlace': nbrPlace,
      'TicketPrice': ticketPrice,
      'picture': picture,
      'nbrAvailableSeats': nbrAvailableSeats,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventRecordDocumentEquality implements Equality<EventRecord> {
  const EventRecordDocumentEquality();

  @override
  bool equals(EventRecord? e1, EventRecord? e2) {
    return e1?.dateEvent == e2?.dateEvent &&
        e1?.location == e2?.location &&
        e1?.titre == e2?.titre &&
        e1?.description == e2?.description &&
        e1?.adresse == e2?.adresse &&
        e1?.nbrPlace == e2?.nbrPlace &&
        e1?.ticketPrice == e2?.ticketPrice &&
        e1?.picture == e2?.picture &&
        e1?.nbrAvailableSeats == e2?.nbrAvailableSeats;
  }

  @override
  int hash(EventRecord? e) => const ListEquality().hash([
        e?.dateEvent,
        e?.location,
        e?.titre,
        e?.description,
        e?.adresse,
        e?.nbrPlace,
        e?.ticketPrice,
        e?.picture,
        e?.nbrAvailableSeats
      ]);

  @override
  bool isValidKey(Object? o) => o is EventRecord;
}
