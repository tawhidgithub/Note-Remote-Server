import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Colors/colors.dart';

class textField extends StatelessWidget {
  const textField(
      {super.key,
      required this.Controller,
      required this.label,
      required this.isSuffixEyeShow,
      this.icon1,
      this.icon2,
      this.obscureTextValue = true,
      this.onClickOnEye,
      this.onChange,
      this.focusController,
      required this.onValidate});

  final String label;
  final Controller;
  final icon1;
  final icon2;
  final bool isSuffixEyeShow;
  final bool obscureTextValue;
  final VoidCallback? onClickOnEye;
  final Function? onChange;
  final FocusNode? focusController;
  final FormFieldValidator onValidate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: onValidate,
      focusNode: focusController,
      obscureText: obscureTextValue,
      controller: Controller,
      cursorColor: AppColors.primaryColorOrange,
      cursorHeight: 20,
      cursorWidth: 1,
      style: GoogleFonts.roboto(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w300,
          letterSpacing: 1),
      decoration: InputDecoration(
          suffixIcon: isSuffixEyeShow == false
              ? IconButton(
                  onPressed: onClickOnEye,
                  icon: FaIcon(
                    icon1,
                    size: 15,
                    color: Colors.grey.shade600,
                  ),
                )
              : IconButton(
                  onPressed: onClickOnEye,
                  icon: FaIcon(
                    icon2,
                    size: 15,
                    color: Colors.grey.shade600,
                  ),
                ),
          label: Text(label),
          labelStyle: GoogleFonts.roboto(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 0.5, color: AppColors.primaryColorOrange)),
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 0.5, color: AppColors.primaryColorOrange))),
      onChanged: (change) => onChange,
    );
  }
}
