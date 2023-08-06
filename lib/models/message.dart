// ignore_for_file: public_member_api_docs, sort_constructors_first
class Message {
  /// ID of the message
  final String id;

  /// ID of the user who posted the message
  final String userId;

  /// Text content of the message
  final int roomId;

  /// Text content of the message
  final String message;

  /// Whether the message is sent by the user or not.
  final bool isMine;

  /// Date and time when the message was created
  final DateTime createdAt;

  /// Date and time when the message was created
  final String type;
  Message({
    required this.id,
    required this.userId,
    required this.roomId,
    required this.message,
    required this.type,
    required this.isMine,
    required this.createdAt,
  });

  Message.fromMap(
    Map<String, dynamic> map,
    String myUserId,
  )   : id = map['id'],
        userId = map['user_id'],
        roomId = map['room_id'],
        message = map['message'],
        isMine = myUserId == map['user_id'],
        type = map['type'],
        createdAt = DateTime.parse(map['created_at']);
}
