class FcmMessage {
  final String title;
  final String body;
  final Map<String, dynamic> data;

  const FcmMessage({
    required this.title,
    required this.body,
    required this.data,
  });
}
