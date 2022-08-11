import 'package:blazp04/features/_all.dart';

class CounterProvider with ChangeNotifier {
  int kolicina = 0;

  void povecaj() {
    kolicina++;
    notifyListeners();
  }

  void smanji() {
    if (kolicina <= 0) {
      return;
    }
    kolicina--;
    notifyListeners();
  }
}
