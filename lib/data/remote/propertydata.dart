
import 'package:realestate/core/constanat/staticdata.dart';

import '../../../core/class/crud.dart';
import '../../core/constanat/apilink.dart';


class PropertyData {
  Crud crud;

  PropertyData(this.crud);

  getPropertyData(
      String property_type,String token) async {
    print(Staticdata.token);
    String link="${ApiLink.property}?property_type=${property_type}";
    var response =
    await crud.getdataasmap(link,token
    );
    return response.fold((l) => l, (r) => r);
  }
}
