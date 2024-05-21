import 'package:get/get.dart';

Validetor(String tybe, int max, int min, String val) {
  if(val.isEmpty){
    return " Can Not Empty";
  }
  if (tybe == "username") {
    print(";lmkfweklemkewsmkfwefl");

    if (!GetUtils.isUsername(val)) {
      return " Not User Name";
    }
  }
  if (tybe == "email") {
    if (!GetUtils.isEmail(val)) {
      return " Not Email";
    }
  }
  if(tybe=="phone"){
    if (!GetUtils.isPhoneNumber(val)) {
      return " Not Phone Number";
    }
  }


  if (val.length > max) {
    return "$tybe Should Not Larger Than $max";
  }
  if (val.length < min) {
    return "$tybe Should Not lesser Than $min";
  }
  return null;
}
