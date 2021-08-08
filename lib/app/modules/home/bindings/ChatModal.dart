class ChatModel {
  final name;
  final icon;
  final isGroup;
  final time;
  final currentMessage;
  final status;
  var select;
  final id;
  ChatModel({
    this.name,
    this.icon,
    this.isGroup,
    this.time,
    this.currentMessage,
    this.status,
    this.select = false,
    this.id,
  });
}
