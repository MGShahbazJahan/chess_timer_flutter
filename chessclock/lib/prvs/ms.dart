import 'package:flutter/foundation.dart';

// just a struct kinda class to store val so can seeing by anywhere
class Ms with ChangeNotifier{
  int m = 5;
  int s = 0;

  void setMS(int tm, int ts){
    m = tm;
    s = ts;
    notifyListeners();
  }
}