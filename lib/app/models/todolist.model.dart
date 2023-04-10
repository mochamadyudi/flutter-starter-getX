class TodoListModel {
  int? id;
  bool? status;
  String? title;

  TodoListModel(this.title,this.id, this.status);

  TodoListModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    status = json['status'];
    title = json['title'];
  }
}