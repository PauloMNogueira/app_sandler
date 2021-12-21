abstract class PersonError implements Exception {
  late String message;

  @override
  String toString() {
    return message;
  }
}

class PersonRepositoryError extends PersonError {
  PersonRepositoryError(String message) {
    this.message = message;
  }
}
