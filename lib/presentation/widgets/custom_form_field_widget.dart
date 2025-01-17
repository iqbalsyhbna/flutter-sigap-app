import 'package:flutter/material.dart';
import 'package:sigap_mobile/core/theme/app_style.dart';

class CustomFieldForm extends StatelessWidget {
  final String? label, hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final IconData icon;
  final IconData? endIcon;
  final int? maxLength, maxLines;
  final Function? onPress;
  final String? Function(String?)? validator;

  const CustomFieldForm({
    Key? key,
    this.label,
    required this.hint,
    this.maxLength,
    this.maxLines,
    this.onPress,
    this.endIcon,
    required this.validator,
    required this.controller,
    this.keyboardType,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: (onPress == null)
          ? TextFormField(
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              controller: controller,
              keyboardType: keyboardType,
              maxLength: maxLength,
              maxLines: maxLines,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  icon,
                  color: primaryColor,
                ),
                suffixIcon: Icon(endIcon),
                hintText: hint,
                labelText: label,
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              validator: validator,
              // validator: (value) => FieldValidator.validate(value!),
            )
          : TextFormField(
              onTap: () => onPress!(),
              readOnly: true,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              controller: controller,
              keyboardType: keyboardType,
              maxLength: maxLength,
              maxLines: maxLines,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(icon),
                suffixIcon: Icon(endIcon),
                hintText: label,
                labelText: hint,
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              validator: validator,
            ),
    );
  }
}

class CustomPasswordFieldForm extends StatelessWidget {
  final String? label, hint;
  final TextEditingController controller;
  final IconData icon;
  final Widget? endIcon;
  final Function? onPress;
  final String? Function(String?)? validator, onSaved, onChanged;
  final String? errorText;
  final bool hiddenText;

  const CustomPasswordFieldForm({
    Key? key,
    this.label,
    required this.hint,
    this.onPress,
    this.endIcon,
    this.errorText,
    this.hiddenText = true,
    this.onSaved,
    this.onChanged,
    required this.validator,
    required this.controller,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: TextFormField(
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        controller: controller,
        decoration: InputDecoration(
          errorText: errorText,
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: primaryColor,
          ),
          suffixIcon: endIcon,
          hintText: hint,
          labelText: label,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        obscureText: hiddenText,
        onSaved: onSaved,
        validator: validator,
        onChanged: onChanged,
        // validator: (value) => FieldValidator.validate(value!),
      ),
    );
  }
}

class CustomFieldPassiveForm extends StatelessWidget {
  final String label, hint;
  final TextInputType? keyboardType;
  final IconData icon;
  final IconData? endIcon;
  final int? maxLength, maxLines;
  final Function? onPress;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const CustomFieldPassiveForm({
    Key? key,
    required this.label,
    required this.hint,
    this.maxLength,
    this.maxLines,
    this.onPress,
    this.endIcon,
    required this.validator,
    required this.controller,
    this.keyboardType,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: TextFormField(
        onTap: () => onPress!(),
        controller: controller,
        readOnly: true,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        keyboardType: keyboardType,
        maxLength: maxLength,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: primaryColor,
          ),
          suffixIcon: Icon(
            endIcon,
            color: primaryColor,
          ),
          hintText: hint,
          labelText: label,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        validator: validator,
      ),
    );
  }
}

class RegisterPasswordRequirement extends StatelessWidget {
  final bool isValid;
  final String message;
  const RegisterPasswordRequirement(
      {Key? key, required this.isValid, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (isValid)
            ? const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
              )
            : const Icon(
                Icons.close,
                color: systemDarkGreyColor,
              ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(message,
              style: baseFontStyleSmall.copyWith(
                  color: (isValid) ? Colors.green : Colors.grey)),
        )
      ],
    );
  }
}
