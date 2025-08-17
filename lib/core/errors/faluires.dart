abstract class Faluire {
  final String message;
  Faluire(this.message);
}

class ServerFaluire extends Faluire {
  ServerFaluire(super.message);
}
