import 'package:odev6/data/entity/category_model.dart';

class CategoriesRepo {
  List<Category> getCategories() {
    List<Category> categories = [];
    categories
        .add(Category(image: "assets/images/k1.png", name: "Yeni Ürünler"));
    categories.add(Category(image: "assets/images/k2.png", name: "Fırından"));
    categories.add(Category(image: "assets/images/k3.png", name: "Su"));
    categories.add(
        Category(image: "assets/images/k4.png", name: "Süt & kahvaltılık"));
    categories
        .add(Category(image: "assets/images/k5.png", name: "Meyve & Sebze"));
    categories.add(Category(image: "assets/images/k6.png", name: "İçecek"));
    categories
        .add(Category(image: "assets/images/k7.png", name: "Atıştırmalık"));
    categories.add(Category(image: "assets/images/k8.png", name: "Dondurma"));
    categories.add(Category(image: "assets/images/k9.png", name: "Hazır Gıda"));

    categories
        .add(Category(image: "assets/images/k10.png", name: "Taze Yemek"));
    categories.add(Category(image: "assets/images/k11.png", name: "Kahve"));
    categories
        .add(Category(image: "assets/images/k12.png", name: "Temel Gıda"));
    return categories;
  }
}
