import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wordup/Core/Resources/app_colors.dart';

class GlobalInputBox extends StatefulWidget {
  // final Color? color;
  // final IconData? icon;
  final String? label;
  final Function? function;
  final Function? onTapFunction;
  final Function? changeFunction;
  final TextEditingController? controller;
  final bool enable;
  final TextInputType textType;
  final bool readOnly;
  final int minLines;
  final int maxLines;
  final bool mustFill;
  final Function? validator;
  final int? maxLength;
  final double fontSize;
  final TextDirection textDirection;
  final bool hideContent;
  final IconData? endIcon;
  final TextInputAction? textInputAction;
  final String fontFamily;
  final List<TextInputFormatter>? inputFormatters;

  const GlobalInputBox({
    Key? key,
    // required this.color,
    // required this.icon,
    required this.label,
    required this.controller,
    this.function,
    this.onTapFunction,
    this.changeFunction,
    this.enable = true,
    this.textType = TextInputType.text,
    this.readOnly = false,
    this.hideContent = false,
    this.minLines = 1,
    this.maxLines = 5,
    this.mustFill = false,
    this.fontSize = 12,
    this.textDirection = TextDirection.ltr,
    this.validator,
    this.maxLength,
    this.endIcon,
    this.textInputAction,
    this.fontFamily = 'montserrat',
    this.inputFormatters,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GlobalInputBoxState createState() => _GlobalInputBoxState();
}

class _GlobalInputBoxState extends State<GlobalInputBox> {
  bool isTapped = false;
  Function? validator;
  Function? onChange;
  @override
  void initState() {
    //this use for set default validator
    if (widget.validator != null) {
      validator = widget.validator;
    } else {
      validator = (value) {
        return null;
      };
    }
    if (widget.changeFunction != null) {
      onChange = widget.changeFunction;
    } else {
      onChange = (value) {
        return null;
      };
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.transparent,
      child: Directionality(
        textDirection: widget.textDirection,
        child: FocusScope(
          onFocusChange: (val) {
            setState(() {
              isTapped = val;
            });
          },
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.hideContent,
            enabled: widget.enable,
            readOnly: widget.readOnly,
            onTap: widget.onTapFunction != null
                ? () async {
                    widget.onTapFunction!();
                  }
                : () {},
            onChanged: (val) => onChange!(val),
            validator: (val) => validator!(val),
            maxLength: widget.maxLength,
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
              counterText: widget.maxLength != null ? null : '',
              counterStyle: const TextStyle(color: Colors.white),
              isDense: true,
              // border: InputBorder.none,
              // contentPadding: const EdgeInsets.only(bottom: 5),
              labelText: widget.label!.toUpperCase(),
              labelStyle: TextStyle(
                fontSize: widget.fontSize * 4 / 5,
                color: isTapped
                    ? AppColors.grey900
                    : AppColors.grey900.withOpacity(.5),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
                // borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
                // borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                // borderRadius: BorderRadius.circular(15),
              ),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                // borderRadius: BorderRadius.circular(15),
              ),
            ),
            style: TextStyle(
              fontSize: widget.fontSize,
              color: AppColors.grey900,
              fontFamily: widget.fontFamily,
            ),
            textInputAction: widget.textInputAction,
            keyboardType: widget.textType,
            minLines: widget.minLines,
            maxLines: widget.maxLines,
          ),
        ),
      ),
    );
  }
}
