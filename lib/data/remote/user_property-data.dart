
import 'package:realestate/core/constanat/staticdata.dart';

import '../../../core/class/crud.dart';
import '../../core/constanat/apilink.dart';


class UserPropertyData {
  Crud crud;

  UserPropertyData(this.crud);

  getPropertyData(String token) async {
    String link="${ApiLink.userproperty}";
    var response =
    await crud.getData( link,"d8e80cb927b0fc9164e4bc0a71686a4054d41be5"
    );
    return response.fold((l) => l, (r) => r);
  }
}
