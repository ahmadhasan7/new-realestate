import 'package:realestate/data/models/category.dart';

class CategoryData{
  List<CategoryModel> data=[
    CategoryModel(imageurl: "Assets/images/ard.jpg", title: "أرض", tybe: 'House',),
    CategoryModel(imageurl: "Assets/images/bayt.jpg", title: "شقة",tybe: 'Apartment'),
    CategoryModel(imageurl: "Assets/images/benaa.jpg", title: "بناء",tybe: 'House'),
    CategoryModel(imageurl: "Assets/images/fela.jpg", title: "فيلا",tybe: 'Villa'),
    CategoryModel(imageurl: "Assets/images/mahl.jpg", title: "محل تجاري",tybe: 'Commercial'),
    CategoryModel(imageurl:"Assets/images/maktab.jpg" , title: "مكتب",tybe: 'Office'),
    CategoryModel(imageurl: "Assets/images/mazraa.jpg", title: "مزرعة",tybe: 'Farm'),
    CategoryModel(imageurl: "Assets/images/shaleh.jpg", title: "شاليه",tybe: 'Chalet')
  ];
}