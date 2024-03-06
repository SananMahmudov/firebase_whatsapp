import 'package:firebase_wp/utils/constants/app_sizedboxs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/login/login_cubit.dart';
import '../../../../data/models/country_model.dart';

class CountryPickerAndPhone extends StatelessWidget {
  const CountryPickerAndPhone({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Padding(
      padding: const EdgeInsets.all(32),
      child: StreamBuilder<List<CountryModel>>(
          stream: cubit.countriesStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox.shrink();
            }
            final countries = snapshot.data ?? [];
            return Column(
              children: [
                StreamBuilder<CountryModel>(
                    stream: cubit.countryStream,
                    builder: (context, snapshot) {
                      final selectedCountry = snapshot.data;
                      return DropdownButton<CountryModel>(
                        value: selectedCountry ?? countries.first,
                        items: countries.map((CountryModel country) {
                          return DropdownMenuItem(
                            value: country,
                            alignment: Alignment.center,
                            child: Text(
                              country.name,
                              textAlign: TextAlign.center,
                            ),
                          );
                        }).toList(),
                        onChanged: (c) => cubit.changeCountry(c!),
                        isExpanded: true,
                        alignment: Alignment.center,
                      );
                    }),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: StreamBuilder<CountryModel>(
                          stream: cubit.countryStream,
                          builder: (context, snapshot) {
                            final selectedCountry = snapshot.data;
                            return SizedBox(
                              height: 56,
                              child: DropdownButton<CountryModel>(
                                value: selectedCountry ?? countries.first,
                                items: countries.map((CountryModel country) {
                                  return DropdownMenuItem(
                                    value: country,
                                    alignment: Alignment.center,
                                    child: Text(
                                      country.phoneLocale,
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (c) => cubit.changeCountry(c!),
                                isExpanded: true,
                                alignment: Alignment.center,
                              ),
                            );
                          }),
                    ),
                    AppSizedboxs.w32,
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 56,
                        child: TextField(
                          controller: cubit.phoneController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            hintText: 'Phone number',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
