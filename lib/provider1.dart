import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class watchListProvider extends ChangeNotifier{
  var _words= {};
  get words => _words;

  void toggleList(dynamic obj){
    var isExist = _words[obj['id']];
    if (isExist != null){
      _words.remove(obj['id']);
    }
    else{
      _words[obj['id']] = obj;
    }
    notifyListeners();
  }

  void clearFavorite(){
    _words = {};
    notifyListeners();
  }

  bool contains(dynamic obj ){
    if(_words[obj['id']] != null){
      return true;
    }
    else{
      return false;
    }
  }

}
