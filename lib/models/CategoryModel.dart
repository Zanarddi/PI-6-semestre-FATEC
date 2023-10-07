class CategoryModel {
  int id;
  int indx;
  String title;
  String imagePath;
  int parent;

  CategoryModel(this.id, this.indx, this.title, this.imagePath, this.parent);

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
    return 'CategoryModel{id: $id, indx: $indx, title: $title, imagePath: $imagePath, parent: $parent}';
  }
}
