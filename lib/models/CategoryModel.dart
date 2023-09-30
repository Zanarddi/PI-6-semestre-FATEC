class CategoryModel {
  int index;
  String title;
  String imagePath;

  CategoryModel(this.index, this.title, this.imagePath);

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'title': title,
      'imagePath': imagePath,
    };
  }

  @override
  String toString() {
    return 'CategoryModel{index: $index, title: $title, imagePath: $imagePath}';
  }
}
