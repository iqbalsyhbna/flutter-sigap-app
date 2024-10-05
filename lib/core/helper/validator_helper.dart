class FieldValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return "Kolom tidak boleh kosong!";
    }
    return null;
  }
}

class PhoneFieldValidator {
  static String? validate(String value) {
    if (value.isEmpty || !PhoneRegexValidator.validate(value)) {
      return "No.Telepon tidak valid!";
    }
    return null;
  }
}

class EmailFieldValidator {
  static String? validate(String value) {
    if (value.isEmpty || !EmailRegexValidator.validate(value)) {
      return "Email tidak valid!";
    }
    return null;
  }
}

class PasswordLoginFieldValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return "Password tidak boleh kosong!";
    }
    return null;
  }
}

class PasswordFieldValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return "Password tidak boleh kosong!";
    } else if (!PasswordRegexValidator.validateAll(value)) {
      return "Password tidak valid!";
    }
    return null;
  }
}

class NikFieldValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return "NIK tidak boleh kosong!";
    } else if (value.length != 16) {
      return "NIK tidak valid";
    }
    return null;
  }
}

class NpwpFieldValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return "NIK tidak boleh kosong!";
    } else if (value.length != 15) {
      return "NIK tidak valid";
    }
    return null;
  }
}

class KodePosFieldValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return "Kode Pos tidak boleh kosong!";
    } else if (!KodePosRegexValidator.validate(value)) {
      return "Kode Pos tidak valid!";
    }
    return null;
  }
}

//--------------------------------------------------------------------
//                          REGEX
//--------------------------------------------------------------------

class PhoneRegexValidator {
  static validate(String phoneNumber) {
    RegExp regex = RegExp(r"^(08)(\d{3,4}-?){2}\d{3,4}$");
    if (!regex.hasMatch(phoneNumber)) {
      return false;
    } else {
      return true;
    }
  }
}

class EmailRegexValidator {
  static validate(String email) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regex.hasMatch(email)) {
      return false;
    } else {
      return true;
    }
  }
}

class KodePosRegexValidator {
  static validate(String phoneNumber) {
    RegExp regex = RegExp(r"^([1-9])[0-9]{4}$");
    if (!regex.hasMatch(phoneNumber)) {
      return false;
    } else {
      return true;
    }
  }
}

// Minimum 8 characters, at least one uppercase letter, one lowercase letter and one number:
// ^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$

// Minimum 8 characters, at least one uppercase, one lowercase, and one number:
// (?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d!@#$%^&*()_+=-{};:'",<.>?`\/\|~-]{8,}

// Minimum 8 characters, at least one uppercase, one lowercase, one number and one special character:
// ^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+=-{};:'",<.>?`\/\|~-])[A-Za-z\d!@#$%^&*()_+=-{};:'",<.>?`\/\|~-]{8,}$

class PasswordRegexValidator {
  static validateAll(String password) {
    RegExp regex = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d!@#$%^&*()_+=-{};:',<.>?`\/\|~-]{8,}$");
    if (!regex.hasMatch(password)) {
      return false;
    }
    return true;
  }

  static containUppercase(String password){
    RegExp regex = RegExp(r"^(?=.*[A-Z])");
    if (!regex.hasMatch(password)) {
      return false;
    }
    return true;
  }

  static containLowercase(String password){
    RegExp regex = RegExp(r"^(?=.*[a-z])");
    if (!regex.hasMatch(password)) {
      return false;
    }
    return true;
  }

  static containNumber(String password){
    RegExp regex = RegExp(r"^(?=.*\d)");
    if (!regex.hasMatch(password)) {
      return false;
    }
    return true;
  }
}