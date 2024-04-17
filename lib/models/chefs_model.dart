import '../utils/convert.dart';

class WorkCategories {
  String? image;
  String? name;

  WorkCategories({
    this.image,
    this.name,
  });
}

List<WorkCategories> categoriesModel = [
  WorkCategories(
    image: "assets/image/chef.jpeg",
    name: "Chef",
  ),
  WorkCategories(
    image: "assets/image/chef.jpeg",
    name: "${translateDataBase(" شيف", "Chef")}",
  ),
  WorkCategories(
    image: "assets/image/chef.jpeg",
    name: "${translateDataBase(" شيف", "Chef")}",
  ),
  WorkCategories(
    image: "assets/image/chef.jpeg",
    name: "${translateDataBase(" شيف", "Chef")}",
  ),
  WorkCategories(
    image: "assets/image/chef.jpeg",
    name: "${translateDataBase(" شيف", "Chef")}",
  ),
];
