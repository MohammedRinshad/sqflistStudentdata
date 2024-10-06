class StudentProvModel {
  final int? id;
  final String? name;
  final String? age;

  StudentProvModel({this.id, this.name, this.age, e});
  StudentProvModel.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        name = res['name'],
        age = res['age'];
  Map<String, Object?> toMap() {
    return {
      "id": id,
      "name": name,
      "age": age,
    };
  }
}
