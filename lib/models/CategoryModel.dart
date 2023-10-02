class CategoryModel {
  int indx;
  String title;
  String imagePath;
  int parent;

  CategoryModel(this.indx, this.title, this.imagePath, this.parent);

  Map<String, dynamic> toMap() {
    return {
      'indx': indx,
      'title': title,
      'imagePath': imagePath,
      'parent': parent,
    };
  }

  @override
  String toString() {
    return 'CategoryModel{indx: $indx, title: $title, imagePath: $imagePath, parent: $parent}';
  }
}
