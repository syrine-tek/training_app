class Exercise {
  final String id;
  final String name;
  final String description;
  final String equipmentId; // Ce champ est essentiel
  final String instructions;
  final String imagePath;
  final String detailImagePath;

  const Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.equipmentId,
    required this.instructions,
    required this.imagePath,
    required this.detailImagePath,
  });
}