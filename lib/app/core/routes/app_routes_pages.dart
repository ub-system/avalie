import 'package:avalie/app/bindings/company_binding.dart';
import 'package:avalie/app/pages/home/form_company.dart';
import 'package:get/get.dart';

import '../../bindings/assessment_binding.dart';
import '../../bindings/profile_binding.dart';
import '../../pages/auth/login_page.dart';
import '../../pages/auth/register_page.dart';
import '../../pages/base_page.dart';
import '../../pages/home/home_page.dart';
import '../../pages/profile/profile_page.dart';
import '../../pages/splash_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.base,
      page: () => const BasePage(),
      bindings: [
        AssessmentBinding(),
        CompanyBinding(),
        ProfileBinding(),
      ]
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      bindings: [
        AssessmentBinding(),
        CompanyBinding(),
      ]
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage()
    ),
    GetPage(
      name: AppRoutes.registerCompany,
      page: () => FormCompanyPage()
    ),
  ];
}

abstract class AppRoutes {
  static const String base = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String profile = '/profile';

  static const String registerCompany = '/register_company';
}
