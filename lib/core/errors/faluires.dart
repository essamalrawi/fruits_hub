abstract class Faluires {
  final String message;

  Faluires(this.message);
}

class ServerFaluire extends Faluires {
  ServerFaluire(super.message);
}
