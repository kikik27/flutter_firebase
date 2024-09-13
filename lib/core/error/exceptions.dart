class ServerException implements Exception {
  final String message;

  ServerException({this.message = "Server Failure"});

  @override
  String toString() {
    return message;
  }
}

class CacheException implements Exception {
  final String message;

  CacheException({this.message = "Cache Failure"});

  @override
  String toString() {
    return message;
  }
}
