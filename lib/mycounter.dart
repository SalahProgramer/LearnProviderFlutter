import 'package:flutter/foundation.dart';

class mycounter extends ChangeNotifier{
  int counter = 0;

  inc() {
    counter++;
    notifyListeners();
  }
  clear(){
    counter=0;
    notifyListeners();
  }

}
