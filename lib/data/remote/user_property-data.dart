
import 'package:realestate/core/constanat/staticdata.dart';

import '../../../core/class/crud.dart';
import '../../core/constanat/apilink.dart';


class UserPropertyData {
  Crud crud;

  UserPropertyData(this.crud);

  getPropertyData(String token) async {
    String link="${ApiLink.userproperty}";
    var response =
    await crud.getData(linkurl:  link,Token: token
    );
    return response.fold((l) => l, (r) => r);
  }
}
