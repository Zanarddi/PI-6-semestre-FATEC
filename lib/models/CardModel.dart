class CardModel {
  int id;
  int indx;
  int category;
  String title;
  String imagePath;

  CardModel(this.id, this.indx, this.category, this.title, this.imagePath);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'indx': indx,
      'category': category,
      'title': title,
      'imagePath': imagePath,
    };
  }

  @override
  String toString() {
    return 'CategoryModel{id: $id, indx: $indx, category: $category, title: $title, imagePath: $imagePath}';
  }
}
