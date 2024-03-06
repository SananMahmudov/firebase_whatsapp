import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../utils/constants/app_assets.dart';
import '../../models/country_model.dart';

class CountryPickerService {
  static CountryPickerService? _instance;
  CountryPickerService._();

  static CountryPickerService get instance =>
      _instance ??= CountryPickerService._();

  List<CountryModel>? _countries;

  Future<List<CountryModel>> getCountries() async {
    try {
      final response = await rootBundle.loadString(AppAssets.countries);
      final List data = jsonDecode(response);
      _countries = data.map((e) => CountryModel.fromJson(e)).toList();
    } catch (_) {
      _countries = [];
    }

    return _countries!;
  }
}
