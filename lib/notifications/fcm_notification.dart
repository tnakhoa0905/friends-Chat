import 'package:chat_app/backend/supabase/database/tables/group_chat_detail.dart';
import 'package:chat_app/backend/supabase/supabase.dart';
import 'package:chat_app/flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../auth/supabase_auth/auth_util.dart';
import 'package:http/http.dart' as http;

class NotificationFCM {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  Future<void> getDeviceToken() async {
    try {
      NotificationSettings settings = await _messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        setDeviceToken();
        print('User granted permission');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        setDeviceToken();
        print('User granted provisional permission');
      } else {
        print('User declined or has not accepted permission');
      }
    } catch (e) {}
  }

  Future<void> setDeviceToken() async {
    print('***** in Notif Class');
    String? device_token = await _messaging.getToken();
    print(device_token);
    await UserTable().update(
      data: {'device_token': device_token},
      matchingRows: (rows) => rows.eq(
        'id',
        currentUser!.uid,
      ),
    );
  }

  void sendNotification(String message, UserRow userRow, int idRoom) async {
    print("id user" + userRow.id);
    final String serverKey =
        'AAAAlfZsDVM:APA91bF2rYHZL6ppDyI_Cz64pL6tS2zJZCB-HBKm-R10-f0LXp35qYPjyW9qM0DxraOJy8H3v_ZCiprtJgWoUzsz9xlCydWWO13VFiDkYmDqZ89yILGSpMw0TcGKN-yzh-0pizp1NMzU'; // Thay thế bằng FCM Server Key của bạn

    final String firebaseCloudMessageUrl =
        'https://fcm.googleapis.com/fcm/send';
    var listGroupDetail = await GroupChatDetailTable().queryRows(
      queryFn: (q) => q.eq(
        'id_group_chat',
        idRoom,
      ),
    );
    for (var item in listGroupDetail) {
      List<UserRow> users = await UserTable()
          .querySingleRow(queryFn: (q) => q.eq("id", item.userId));
      if (!users[0].id.contains(userRow.id) ||
          users[0].deviceToken!.isEmpty == false) {
        print(users[0].id);
        final Map<String, dynamic> notificationData = {
          'notification': {
            'title': "${userRow.name} đã gửi tin nhắn cho bạn",
            'body': message,
          },
          'android': {
            'notification': {'imageUrl': 'https://foo.bar.pizza-monster.png'}
          },
          'data': {'id_room': '$idRoom'},
          'to': users[0].deviceToken
          // '{${userRow2.deviceToken}}', // Thay thế bằng Registration Token của thiết bị muốn gửi thông báo
        };

        final headers = {
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverKey',
        };

        try {
          final response = await http.post(
            Uri.parse(firebaseCloudMessageUrl),
            headers: headers,
            body: jsonEncode(notificationData),
          );

          if (response.statusCode == 200) {
            print('Thông báo đã được gửi thành công!');
          } else {
            print('Lỗi khi gửi thông báo. Mã lỗi: ${response.statusCode}');
          }
        } catch (e) {
          print('Lỗi khi gửi thông báo: $e');
        }
      }
    }
  }
}
