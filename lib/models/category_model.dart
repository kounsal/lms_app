import '../utils/assets_manager.dart';

class CategoryModel {
  String title;
  String icon;
  String routeName;

  CategoryModel ({required this.title, required this.icon , required this.routeName});
}

List<CategoryModel> getCategories = [
  CategoryModel(title: 'All Courses', icon: ImageManager.video , routeName: '/all-courses'),
  CategoryModel(title: 'Free Videos', icon: ImageManager.graphic , routeName: '/free-videos'),
  CategoryModel(title: 'Test Series', icon: ImageManager.video , routeName: '/test-series'),
  CategoryModel(title: 'Quiz', icon: ImageManager.personalDevelopment , routeName: '/quiz'),
  CategoryModel(title: 'Books', icon: ImageManager.math, routeName: '/books'),
];