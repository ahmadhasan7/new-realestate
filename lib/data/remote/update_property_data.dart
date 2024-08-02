import 'dart:io';

import 'package:realestate/core/constanat/staticdata.dart';
import '../../../core/class/crud.dart';
import '../../core/constanat/apilink.dart';


class UpdateUserPropertyData {
  Crud crud;

  UpdateUserPropertyData(this.crud);

  UpdatePropertyDeatilsData

      (

      String property_type,String phone_number,String title, String description, String city,
      String region, String street , String property_number , String price , String plot_area , String total_floors ,
      String floor_number , String bedrooms ,String bathrooms , String kitchens , String living_rooms ,
      String property_status, bool elevator , bool pool , bool solar_panels , String furnishing , String direction ,
      String total_rooms , String rent_type , String covering , String token,String slug) async {
    var response =
    await crud.patchData(linkurl: "${ApiLink.updateproperty}${slug}/",Token: token,data: {
      "property_type":property_type,
      "property_status":property_status,
      "elevator":elevator.toString(),
      "pool":pool.toString(),
      "solar_panels":solar_panels.toString(),
      "furnishing":furnishing,
      "direction":direction,
      "total_rooms":total_rooms,
      "rent_type":"شهري",
      "covering":"عادي",
      "phone_number":phone_number,
      "title":title,
      "description":description,
      'location.city':city,
      'location.street':street,
      'location.region':region,
      "property_number":property_number,
      "price":price,
      "plot_area":plot_area,
      "total_floors":total_floors,
      "floor_number":"2",
      "bedrooms":bedrooms,
      "bathrooms":bathrooms,
      "kitchens":kitchens,
      "living_rooms":living_rooms
    },
    );
    return response.fold((l) => l, (r) => r);
  }
}
