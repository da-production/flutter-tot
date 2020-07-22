class TodoModel{
  final id;
  final title;
  final description;
  final favorite;
  TodoModel({
    this.id,
    this.title,
    this.description,
    this.favorite = false
  });
}