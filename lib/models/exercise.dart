class Exercise {
  final String id;
  final String name;
  final String description;
  final String equipmentId;
  final String instructions;
  final String imagePath;
  final String detailImagePath;
  final double? thumbnailHeight;
  final double? thumbnailWidth;
  final double? detailImageHeight;
  final double? detailImageWidth;
  final bool isCompleted;

  const Exercise({ // Ajout de const
    required this.id,
    required this.name,
    required this.description,
    required this.equipmentId,
    required this.instructions,
    required this.imagePath,
    required this.detailImagePath,
    this.thumbnailHeight,
    this.thumbnailWidth,
    this.detailImageHeight,
    this.detailImageWidth,
    this.isCompleted = false,
  });

  Exercise copyWith({
    String? id,
    String? name,
    String? description,
    String? equipmentId,
    String? instructions,
    String? imagePath,
    String? detailImagePath,
    double? thumbnailHeight,
    double? thumbnailWidth,
    double? detailImageHeight,
    double? detailImageWidth,
    bool? isCompleted,
  }) {
    return Exercise(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      equipmentId: equipmentId ?? this.equipmentId,
      instructions: instructions ?? this.instructions,
      imagePath: imagePath ?? this.imagePath,
      detailImagePath: detailImagePath ?? this.detailImagePath,
      thumbnailHeight: thumbnailHeight ?? this.thumbnailHeight,
      thumbnailWidth: thumbnailWidth ?? this.thumbnailWidth,
      detailImageHeight: detailImageHeight ?? this.detailImageHeight,
      detailImageWidth: detailImageWidth ?? this.detailImageWidth,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}