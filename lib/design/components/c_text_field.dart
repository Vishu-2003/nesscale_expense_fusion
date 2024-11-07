import 'package:expense_fusion/design/components/c_text.dart';
import 'package:expense_fusion/design/screens/Home/home_view.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_theme.dart';
import '../../utils/select_image.dart';
import 'c_core_button.dart';

class CTextField extends StatelessWidget{
  final int? maxLength;
  final bool showBorders;
  final Key? formFieldKey;
  final bool readOnly;
  final bool enabled;
  final bool obscureText;
  final String? labelText;
  final String? hintText;
  final double? fontSize;
  final int? maxLines;
  final TextAlign textAlign;
  final int? minLines;
  final Color? fillColor;
  final Color? textColor;
  final String? helperText;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? suffixText;
  final String? prefixText;
  final EdgeInsets? contentPadding;
  final void Function()? onTap;
  final Color? hintTextColor;
  final TextStyle? hintTextStyle;
  final void Function(String)? onSubmit;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final List<TextInputFormatter>? inputFormatters;
  final BoxConstraints? prefixIconConstraints;

  const CTextField({
    Key? key,
    this.maxLength,
    this.formFieldKey,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.showBorders = true,
    this.labelText,
    this.hintText,
    this.helperText,
    this.fontSize,
    this.maxLines = 1,
    this.minLines = 1,
    this.focusNode,
    this.onTap,
    this.fillColor,
    this.onSubmit,
    this.textColor,
    this.onChanged,
    this.suffixText,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.controller,
    this.validator,
    this.keyboardType,
    this.hintTextColor,
    this.floatingLabelBehavior,
    this.textAlign = TextAlign.start,
    this.textInputAction = TextInputAction.next,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
    this.prefixText,
    this.prefixIconConstraints,
    this.hintTextStyle,
  }) : super(key: key);


  static OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(width: 1, color: Primarycolor),
  );

  static OutlineInputBorder disabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(width: 1, color: grey1),
  );

  static OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(width: 1, color:grey1 ),
  );

  static OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(width: 1, color: red),
  );

  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(width: 1, color: red)
  );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      key: formFieldKey,
      enabled: enabled,
      cursorHeight: 20,
      autocorrect: false,
      minLines: minLines,
      readOnly: readOnly,
      maxLines: maxLines,
      textAlign: textAlign,
      focusNode: focusNode,
      validator: validator,
      maxLength: maxLength,
      controller: controller,
      obscureText: obscureText,
      onFieldSubmitted: onSubmit,
      keyboardType: keyboardType,
      cursorColor: Primarycolor,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      style: TextThemeX.text16.copyWith(fontSize: fontSize, color: textColor ?? white),
      decoration: InputDecoration(
        isDense: true,
        errorMaxLines: 2,
        prefixIcon: prefixIcon,
        prefixIconConstraints:prefixIconConstraints ,
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelText: labelText,
        floatingLabelBehavior: floatingLabelBehavior,
        hintStyle: hintTextStyle??TextThemeX.text16,
        labelStyle: TextThemeX.text16.copyWith(fontSize: 14,color:Primarycolor ),
        filled: true,
        helperMaxLines: 3,
        fillColor: fillColor ?? bg,
        border: showBorders ? focusedBorder : InputBorder.none,
        errorBorder: showBorders ? errorBorder : InputBorder.none,
        enabledBorder: showBorders ? enabledBorder : InputBorder.none,
        focusedBorder: showBorders ? focusedBorder : InputBorder.none,
        disabledBorder: showBorders ? disabledBorder : InputBorder.none,
        focusedErrorBorder: showBorders ? focusedErrorBorder : InputBorder.none,
      ),
    );
  }

}
class CDatePickerField extends StatefulWidget {
  final bool isRequired;
  final String? labelText;
  final DateTime? lastDate;
  final DateTime? firstDate;
  DateTime? initialDate;
  final String? hinttext;
  final void Function(DateTime? date)? onDateSelected;
  CDatePickerField({
    super.key,
    this.initialDate,
    this.isRequired = true,
    this.onDateSelected,
    this.labelText,
    this.lastDate,
    this.firstDate,
    this.hinttext,
  });

  @override
  State<CDatePickerField> createState() => _CDatePickerFieldState();
}

class _CDatePickerFieldState extends State<CDatePickerField> {
  @override
  Widget build(BuildContext context) {
    return CTextField(
          readOnly: true,
          maxLines: 1,
          controller:TextEditingController(text: widget.initialDate?.getDefaultDateFormat),
          hintText: widget.initialDate==null?'Date':null,
          suffixIcon: widget.initialDate == null
              ? selectIcon(AppIcon.calender)
              : CCoreButton(
            onPressed: () {
              setState(() {
                widget.initialDate = null;
                widget.onDateSelected?.call(null);
                FocusScope.of(context).unfocus();
              });
            },
            child: Icon(CupertinoIcons.clear_circled, color: grey1),
          ),
        labelText: widget.labelText,
        onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: widget.initialDate,
          firstDate: widget.firstDate ?? DateTime(1900),
          lastDate: widget.lastDate ?? DateTime.now().add(const Duration(days: 2200)),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.dark(
                  primary: Primarycolor,
                  onPrimary: grey1,
                  onSurface: white,
                ),
                dialogBackgroundColor: grey1, // Dialog background color
              ),
              child: child!,
            );
          },
          );
        if (pickedDate != null) {
          setState(() {
            widget.initialDate = pickedDate;
            widget.onDateSelected?.call(pickedDate);
          });
        }
      },



    );
  }
}
