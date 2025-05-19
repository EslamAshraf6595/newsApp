import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:news_app/utils/appColors.dart';
import 'package:provider/provider.dart';

typedef MyValiadatorFunction = String? Function(String?)?;

class CustomTextformField extends StatelessWidget {
  CustomTextformField({
    super.key,
    this.borderColor,
    this.hintText,
    this.labelText,
    this.hinttextStyle,
    this.prefixicon,
    this.maxLines,
    this.controllerText,
    this.validator,
    this.suffixicon,
    this.keyBordType,
    this.onChanged,
  });
  final void Function(String)? onChanged;
  MyValiadatorFunction validator;
  Color? borderColor;
  String? hintText;
  String? labelText;
  int? maxLines;
  TextStyle? hinttextStyle, lebeltextStyle;
  Widget? prefixicon, suffixicon;
  TextEditingController? controllerText;
  TextInputType? keyBordType;

  @override
  Widget build(BuildContext context) {
    var themeProvidet = Provider.of<ThemeProvider>(context);
    return TextFormField(
      keyboardType: keyBordType ?? TextInputType.text,
      validator: validator,
      controller: controllerText,
      style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
      onChanged: onChanged, 
      decoration: InputDecoration(
        prefixIcon: prefixicon,
        prefixIconColor: Theme.of(context).scaffoldBackgroundColor,
        suffixIcon: suffixicon,
        suffixIconColor: Theme.of(context).scaffoldBackgroundColor,
        hintText: hintText,
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Appcolors.whiteBgColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Appcolors.whiteColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
