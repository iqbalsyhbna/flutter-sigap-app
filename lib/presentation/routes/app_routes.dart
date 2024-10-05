import 'package:get/get_navigation/get_navigation.dart';
import 'package:sigap_mobile/presentation/pages/auth/login/login_binding.dart';
import 'package:sigap_mobile/presentation/pages/auth/login/login_page.dart';
import 'package:sigap_mobile/presentation/pages/auth/signup/signup_binding.dart';
import 'package:sigap_mobile/presentation/pages/auth/signup/signup_page.dart';
import 'package:sigap_mobile/presentation/pages/home/home_binding.dart';
import 'package:sigap_mobile/presentation/pages/home/home_page.dart';
import 'package:sigap_mobile/presentation/routes/app_routename.dart';

appPages() => [
      GetPage(
        name: RouteName.SIGN_IN,
        page: () => const LoginPage(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: RouteName.SIGN_UP,
        page: () => const SignupPage(),
        binding: SignupBinding(),
      ),
      GetPage(
        name: RouteName.HOME,
        page: () => const HomePage(),
        binding: HomeBinding(),
      ),
    ];
