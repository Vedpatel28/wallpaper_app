
class ApiModal {
  final int id;
  final int userId;
  final String title;
  final String body;

  ApiModal({
    required this.title,
    required this.id,
    required this.body,
    required this.userId,
  });

  factory ApiModal.fromMap({required Map data}) {
    return ApiModal(
      title: data['title'],
      id: data['id'],
      body: data['body'],
      userId: data['userId'],
    );
  }
}
