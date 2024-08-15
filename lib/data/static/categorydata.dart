import 'package:realestate/data/models/category.dart';

class CategoryData{
  List<CategoryModel> data=[
    CategoryModel(imageurl: "Assets/images/ard.jpg", title: "أرض", tybe: 'أرض',),
    CategoryModel(imageurl: "Assets/images/bayt.jpg", title: "شقة",tybe: 'شقة'),
    CategoryModel(imageurl: "Assets/images/benaa.jpg", title: "بناء",tybe: 'بناء'),
    CategoryModel(imageurl: "Assets/images/fela.jpg", title: "فيلا",tybe: 'فيلا'),
    CategoryModel(imageurl: "Assets/images/mahl.jpg", title: "محل تجاري",tybe: 'تجاري'),
    CategoryModel(imageurl:"Assets/images/maktab.jpg" , title: "مكتب",tybe: 'مكتب'),
    CategoryModel(imageurl: "Assets/images/mazraa.jpg", title: "مزرعة",tybe: 'مزرعة'),
    CategoryModel(imageurl: "Assets/images/shaleh.jpg", title: "شاليه",tybe: 'شاليه')
  ];
}