import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  LoginTextField(this.onChanged);

  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TextField(
      onChanged: onChanged,
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
      ],
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: LocaleKeys.text_inputPhoneNumber.tr(),
        prefixIconConstraints: BoxConstraints(maxWidth: 100),
        contentPadding: const EdgeInsets.all(19),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Icon(
                Icons.stars_rounded,
                color: theme.colorScheme.primary,
              ),
              Padding(padding: const EdgeInsets.only(left: 5)),
              Text(
                '+84',
                style: theme.textTheme.subtitle1,
              ),
              Container(
                width: 1,
                height: 17,
                margin: const EdgeInsets.only(left: 10),
                color: theme.colorScheme.onBackground,
              ),
            ],
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: theme.splashColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
