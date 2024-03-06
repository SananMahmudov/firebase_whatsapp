class CountryModel {
  final String name;
  final String phoneLocale;
  final String locale;

  CountryModel({
    required this.name,
    required this.phoneLocale,
    required this.locale,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: json["name"],
        phoneLocale: json["phone_locale"],
        locale: json["locale"],
      );
}
