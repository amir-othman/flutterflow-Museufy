// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class NotificationsStruct extends FFFirebaseStruct {
  NotificationsStruct({
    DateTime? date,
    String? title,
    String? message,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _title = title,
        _message = message,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  static NotificationsStruct fromMap(Map<String, dynamic> data) =>
      NotificationsStruct(
        date: data['date'] as DateTime?,
        title: data['title'] as String?,
        message: data['message'] as String?,
      );

  static NotificationsStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'title': _title,
        'message': _message,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
      }.withoutNulls;

  static NotificationsStruct fromSerializableMap(Map<String, dynamic> data) =>
      NotificationsStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NotificationsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationsStruct &&
        date == other.date &&
        title == other.title &&
        message == other.message;
  }

  @override
  int get hashCode => const ListEquality().hash([date, title, message]);
}

NotificationsStruct createNotificationsStruct({
  DateTime? date,
  String? title,
  String? message,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotificationsStruct(
      date: date,
      title: title,
      message: message,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotificationsStruct? updateNotificationsStruct(
  NotificationsStruct? notifications, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notifications
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotificationsStructData(
  Map<String, dynamic> firestoreData,
  NotificationsStruct? notifications,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notifications == null) {
    return;
  }
  if (notifications.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && notifications.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notificationsData =
      getNotificationsFirestoreData(notifications, forFieldValue);
  final nestedData =
      notificationsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = notifications.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotificationsFirestoreData(
  NotificationsStruct? notifications, [
  bool forFieldValue = false,
]) {
  if (notifications == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notifications.toMap());

  // Add any Firestore field values
  notifications.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotificationsListFirestoreData(
  List<NotificationsStruct>? notificationss,
) =>
    notificationss
        ?.map((e) => getNotificationsFirestoreData(e, true))
        .toList() ??
    [];
