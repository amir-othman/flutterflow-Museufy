// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CardStruct extends FFFirebaseStruct {
  CardStruct({
    String? year,
    String? month,
    String? cvv,
    String? cardNumber,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _year = year,
        _month = month,
        _cvv = cvv,
        _cardNumber = cardNumber,
        super(firestoreUtilData);

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  set year(String? val) => _year = val;

  bool hasYear() => _year != null;

  // "month" field.
  String? _month;
  String get month => _month ?? '';
  set month(String? val) => _month = val;

  bool hasMonth() => _month != null;

  // "cvv" field.
  String? _cvv;
  String get cvv => _cvv ?? '';
  set cvv(String? val) => _cvv = val;

  bool hasCvv() => _cvv != null;

  // "cardNumber" field.
  String? _cardNumber;
  String get cardNumber => _cardNumber ?? '';
  set cardNumber(String? val) => _cardNumber = val;

  bool hasCardNumber() => _cardNumber != null;

  static CardStruct fromMap(Map<String, dynamic> data) => CardStruct(
        year: data['year'] as String?,
        month: data['month'] as String?,
        cvv: data['cvv'] as String?,
        cardNumber: data['cardNumber'] as String?,
      );

  static CardStruct? maybeFromMap(dynamic data) =>
      data is Map ? CardStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'year': _year,
        'month': _month,
        'cvv': _cvv,
        'cardNumber': _cardNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'year': serializeParam(
          _year,
          ParamType.String,
        ),
        'month': serializeParam(
          _month,
          ParamType.String,
        ),
        'cvv': serializeParam(
          _cvv,
          ParamType.String,
        ),
        'cardNumber': serializeParam(
          _cardNumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static CardStruct fromSerializableMap(Map<String, dynamic> data) =>
      CardStruct(
        year: deserializeParam(
          data['year'],
          ParamType.String,
          false,
        ),
        month: deserializeParam(
          data['month'],
          ParamType.String,
          false,
        ),
        cvv: deserializeParam(
          data['cvv'],
          ParamType.String,
          false,
        ),
        cardNumber: deserializeParam(
          data['cardNumber'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CardStruct &&
        year == other.year &&
        month == other.month &&
        cvv == other.cvv &&
        cardNumber == other.cardNumber;
  }

  @override
  int get hashCode => const ListEquality().hash([year, month, cvv, cardNumber]);
}

CardStruct createCardStruct({
  String? year,
  String? month,
  String? cvv,
  String? cardNumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CardStruct(
      year: year,
      month: month,
      cvv: cvv,
      cardNumber: cardNumber,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CardStruct? updateCardStruct(
  CardStruct? card, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    card
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCardStructData(
  Map<String, dynamic> firestoreData,
  CardStruct? card,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (card == null) {
    return;
  }
  if (card.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && card.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cardData = getCardFirestoreData(card, forFieldValue);
  final nestedData = cardData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = card.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCardFirestoreData(
  CardStruct? card, [
  bool forFieldValue = false,
]) {
  if (card == null) {
    return {};
  }
  final firestoreData = mapToFirestore(card.toMap());

  // Add any Firestore field values
  card.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCardListFirestoreData(
  List<CardStruct>? cards,
) =>
    cards?.map((e) => getCardFirestoreData(e, true)).toList() ?? [];
