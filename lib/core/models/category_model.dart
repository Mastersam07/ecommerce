class Category {
  final String name;
  final String slug;

  Category({required this.name, required this.slug});
}

// Demo data for our cart

List<Category> categories = [
  Category(name: 'Shoes', slug: 'shoes'),
  Category(name: 'Clothes', slug: 'clothes'),
  Category(name: 'Fashion', slug: 'fashion'),
  Category(name: 'Beauty', slug: 'beauty'),
  Category(name: 'Gadjets', slug: 'gadjets'),
];
