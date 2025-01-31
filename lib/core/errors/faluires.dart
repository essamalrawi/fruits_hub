abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFaluire extends Failure {
  ServerFaluire(super.message);
}
