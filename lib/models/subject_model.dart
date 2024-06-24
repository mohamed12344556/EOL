class SubjectModel {
  final int? id;
  final String? title;
  final String? imgPath;

  SubjectModel({
    this.id,
    this.title,
    this.imgPath,
  });

  factory SubjectModel.fromMap(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['subjects_id'],
      title: json['subjects_name'],
      imgPath: json['subjects_image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'subjects_id': id,
      'subjects_name': title,
      'subjects_image': imgPath,
    };
  }

  SubjectModel copyWith({
    int? id,
    String? title,
    String? imgPath,
  }) {
    return SubjectModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imgPath: imgPath ?? this.imgPath,
    );
  }
}
