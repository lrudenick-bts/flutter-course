class PushMessage {

  final String messageId;
  final String title;
  final String body;
  final DateTime sentDate;
  final Map<String, dynamic>? data;
  final String? imageUrl;

  PushMessage({
    required this.title, 
    required this.messageId, 
    required this.body, 
    required this.sentDate, 
    this.data, 
    this.imageUrl
  });

  @override
  String toString() {
    return '''
    PushNotification:
      - Title:      $title
      - MessageId:  $messageId
      - Body:       $body, 
      - SentDate:   $sentDate
      - Data:       $data, 
      - ImageUrl:   $imageUrl
    ''';
  }

}