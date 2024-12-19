import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _notifications = prefs
              .getStringList('ff_notifications')
              ?.map((x) {
                try {
                  return NotificationsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _notifications;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_card')) {
        try {
          final serializedData = prefs.getString('ff_card') ?? '{}';
          _card = CardStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _likedArts = prefs
              .getStringList('ff_likedArts')
              ?.map((path) => path.ref)
              .toList() ??
          _likedArts;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<NotificationsStruct> _notifications = [];
  List<NotificationsStruct> get notifications => _notifications;
  set notifications(List<NotificationsStruct> value) {
    _notifications = value;
    prefs.setStringList(
        'ff_notifications', value.map((x) => x.serialize()).toList());
  }

  void addToNotifications(NotificationsStruct value) {
    notifications.add(value);
    prefs.setStringList(
        'ff_notifications', _notifications.map((x) => x.serialize()).toList());
  }

  void removeFromNotifications(NotificationsStruct value) {
    notifications.remove(value);
    prefs.setStringList(
        'ff_notifications', _notifications.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromNotifications(int index) {
    notifications.removeAt(index);
    prefs.setStringList(
        'ff_notifications', _notifications.map((x) => x.serialize()).toList());
  }

  void updateNotificationsAtIndex(
    int index,
    NotificationsStruct Function(NotificationsStruct) updateFn,
  ) {
    notifications[index] = updateFn(_notifications[index]);
    prefs.setStringList(
        'ff_notifications', _notifications.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInNotifications(int index, NotificationsStruct value) {
    notifications.insert(index, value);
    prefs.setStringList(
        'ff_notifications', _notifications.map((x) => x.serialize()).toList());
  }

  CardStruct _card = CardStruct();
  CardStruct get card => _card;
  set card(CardStruct value) {
    _card = value;
    prefs.setString('ff_card', value.serialize());
  }

  void updateCardStruct(Function(CardStruct) updateFn) {
    updateFn(_card);
    prefs.setString('ff_card', _card.serialize());
  }

  List<DocumentReference> _likedArts = [];
  List<DocumentReference> get likedArts => _likedArts;
  set likedArts(List<DocumentReference> value) {
    _likedArts = value;
    prefs.setStringList('ff_likedArts', value.map((x) => x.path).toList());
  }

  void addToLikedArts(DocumentReference value) {
    likedArts.add(value);
    prefs.setStringList('ff_likedArts', _likedArts.map((x) => x.path).toList());
  }

  void removeFromLikedArts(DocumentReference value) {
    likedArts.remove(value);
    prefs.setStringList('ff_likedArts', _likedArts.map((x) => x.path).toList());
  }

  void removeAtIndexFromLikedArts(int index) {
    likedArts.removeAt(index);
    prefs.setStringList('ff_likedArts', _likedArts.map((x) => x.path).toList());
  }

  void updateLikedArtsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    likedArts[index] = updateFn(_likedArts[index]);
    prefs.setStringList('ff_likedArts', _likedArts.map((x) => x.path).toList());
  }

  void insertAtIndexInLikedArts(int index, DocumentReference value) {
    likedArts.insert(index, value);
    prefs.setStringList('ff_likedArts', _likedArts.map((x) => x.path).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
