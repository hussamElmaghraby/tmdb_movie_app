class EnvConfigs {
  factory EnvConfigs({
    required Map<String, dynamic> envValues,
  }) {
    _instance ??= EnvConfigs._internal(
      envValues,
    );
    return _instance!;
  }

  EnvConfigs._internal(
      this.envValues,
      );

  /// The values that belong to the flavor.
  final Map<String, dynamic> envValues;

  static EnvConfigs? _instance;

  static EnvConfigs? get instance {
    return _instance;
  }

  /// Gets a value given a key.
  static dynamic getValue(String? key) => _instance!.envValues[key!];
}
