class SessionListException implements Exception {
  final String message;

  const SessionListException(this.message);
  @override
  String toString()=>message;
}