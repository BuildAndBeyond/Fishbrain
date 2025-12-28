class RigStats {
  final int rigId;
  final String name;
  final String mode;
  final int uses;
  final int catches;

  const RigStats({
    required this.rigId,
    required this.name,
    required this.mode,
    required this.uses,
    required this.catches,
  });

  double get successRate => uses == 0 ? 0 : catches / uses * 100;

  bool get zeroCatchWarning => uses >= 5 && catches == 0;
}
