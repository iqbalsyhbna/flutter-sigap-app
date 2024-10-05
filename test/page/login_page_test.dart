import 'package:flutter_test/flutter_test.dart';
import 'package:sigap_mobile/core/helper/validator_helper.dart';

void main() {
  const username = "user";
  const password = "password";

  group('''Testing Username Field in Login Page''', () {
    test('''Empty username return error warning''', () {
      var result = FieldValidator.validate('');
      expect(result, "Kolom tidak boleh kosong!");
    });

    test('''Non-empty username return nothing error (null error)''', () {
      var result = FieldValidator.validate(username);
      expect(result, null);
    });
  });

  group('''Test Password Field in Login Form Page''', () {
    test('''Input empty password
    should return warning''', () {
      // act
      var result = PasswordLoginFieldValidator.validate('');
      // assert
      expect(result, "Password tidak boleh kosong!");
    });

    test('''Input password
    should nothing error''', () {
      var result = PasswordLoginFieldValidator.validate(password);
      expect(result, null);
    });
  });
}
