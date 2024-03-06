import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_wp/presentation/pages/login/verify_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/subjects.dart';

import '../../data/models/country_model.dart';
import '../../data/services/local/country_picker_service.dart';
import '../../presentation/pages/home/home_page.dart';
import '../home/home_cubit.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController verifyController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;

  CountryModel initialCountry =
      CountryModel(name: 'Azerbaijan', phoneLocale: '+994', locale: 'AZ');

  late final countriesSubject = BehaviorSubject<List<CountryModel>>();
  late final countrySubject = BehaviorSubject<CountryModel>();

  Stream<List<CountryModel>> get countriesStream => countriesSubject.stream;
  Stream<CountryModel> get countryStream => countrySubject.stream;

  void getCountries() async {
    List<CountryModel> countries =
        await CountryPickerService.instance.getCountries();
    countriesSubject.add(countries);
  }

  void changeCountry(CountryModel newCountry) {
    countrySubject.add(newCountry);
  }

  Future<void> signWithPhone(BuildContext context) async {
    final phoneNumber = countrySubject.value.phoneLocale + phoneController.text;
    log('Phone: $phoneNumber');
    await _auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential)  async {
        await _auth.signInWithCredential(credential);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (_) => HomeCubit(),
              child: const HomePage(),
            ),
          ),
          (route) => route.isCurrent,
        );
      },
      verificationFailed: (FirebaseAuthException e) => log(e.toString()),
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<LoginCubit>(),
              child: const VerifyPage(),
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verify(context) async {
    log('_verificationId: $_verificationId');
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: verifyController.text,
    );

    await _auth.signInWithCredential(credential).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomePage(),
          ),
        ),
        (route) => route.isCurrent,
      );
    });
  }

  @override
  Future<void> close() {
    countriesSubject.close();
    countrySubject.close();
    phoneController.dispose();
    return super.close();
  }
}
