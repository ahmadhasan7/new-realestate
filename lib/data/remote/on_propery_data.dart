

import '../../../core/class/crud.dart';
import '../../core/constanat/apilink.dart';


class OnePropertyData {
  Crud crud;

  OnePropertyData(this.crud);

  getPropertyData(
      String property_slug,String token) async {
    String link="${ApiLink.onproperty}${property_slug}";
    var response =
    await crud.getDataAsMap(linkurl: link,
    );
    return response.fold((l) => l, (r) => r);
  }
}
