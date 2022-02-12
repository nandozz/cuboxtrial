import 'package:get/get.dart';

import '../modules/complete_register/bindings/complete_register_binding.dart';
import '../modules/complete_register/views/complete_register_view.dart';
import '../modules/configuration/bindings/configuration_binding.dart';
import '../modules/configuration/views/configuration_view.dart';
import '../modules/courier/bindings/courier_binding.dart';
import '../modules/courier/views/courier_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pairing/bindings/pairing_binding.dart';
import '../modules/pairing/views/pairing_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/scanning/bindings/scanning_binding.dart';
import '../modules/scanning/views/scanning_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;
  // static const INITIAL = '/scanning';

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SCANNING,
      page: () => ScanningView(),
      binding: ScanningBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.COURIER,
      page: () => CourierView(),
      binding: CourierBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PAIRING,
      page: () => PairingView(),
      binding: PairingBinding(),
    ),
    GetPage(
      name: _Paths.CONFIGURATION,
      page: () => ConfigurationView(),
      binding: ConfigurationBinding(),
    ),
    GetPage(
      name: _Paths.COMPLETE_REGISTER,
      page: () => CompleteRegisterView(),
      binding: CompleteRegisterBinding(),
    ),
  ];
}
