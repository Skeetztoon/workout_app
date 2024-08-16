class EmptyTitleException implements Exception {
  final String message;

  const EmptyTitleException(this.message);
  @override
  String toString()=>message;
}