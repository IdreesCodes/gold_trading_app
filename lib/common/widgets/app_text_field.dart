// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/app_constants.dart';
import '../../utils/color_constants.dart';
import '../../utils/helper_functions.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final int? maxLines;

  final String? hintText;
  final String title;
  final String? info;
  //final FocusNode? focusNode=FocusNode();
  //final bool autofocus;

  final bool? isFilterScreen;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function()? onClick;
  final Function(String)? onFieldSubmitted;
  final double titleSpacing;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? focusBorderColor;
  final double? hintFontSize;
  final FontWeight? fontWeight;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextStyle? titleTextStyle;
  final bool noHeight;
  final bool readOnly;
  final Border? border;
  final bool bottomPedding;
  final double borderRadius;
  final TextStyle? style;
  final bool multiLine;
  final TextStyle? hintTextStyle;
  AppTextFormField({
    Key? key,
    this.title = '',
    this.info,
    this.border,
    this.hintText,
    this.isFilterScreen = false,
    this.maxLines = 1,
    this.hintTextStyle,
    this.borderColor,
    this.focusBorderColor,
    this.onClick,
    this.style,
    this.onFieldSubmitted,
    this.bottomPedding = true,
    this.hintFontSize,
    this.controller,
    this.noHeight = false,
    //this.autofocus = false,
    this.readOnly = false,
    this.backgroundColor,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.titleSpacing = 2,
    this.titleTextStyle,
    this.fontSize,
    this.fontWeight,
    this.textInputType,
    this.multiLine = false,
    this.borderRadius = 10,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  final FocusNode _focusNode = FocusNode();

@override
  void dispose() {
  _focusNode.dispose();
  super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.title.isNotEmpty)
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(widget.title,
                            style: widget.titleTextStyle ??
                                AppConstants.description.copyWith(
                                    color: ColorConstants.primary,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ),
                    // widget.info == null || widget.info == ''
                    //     ? const SizedBox()
                    //     : IconButton(
                    //         onPressed: () {
                    //           HelperFunctions.showModuleInfo(context,
                    //               infoText: widget.info.toString());
                    //         },
                    //         icon: Icon(
                    //           Icons.info_outline_rounded,
                    //           color: ColorConstants.primary,
                    //         )),
                  ],
                ),
              if (widget.title.isNotEmpty) SizedBox(height: widget.titleSpacing),
              GestureDetector(
                  onTap: widget.onClick,
                  // decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(borderRadius),
                  //                     color: backgroundColor ?? Colors.transparent,
                  //                     border: border ??
                  //                         Border.all(
                  //                           color: ColorConstants.black,
                  //                         ),
                  //                   ),
                  //                   height: multiLine ? null : 50,
                  //                   padding: bottomPedding
                  //                       ? const EdgeInsets.only(left: 20, bottom: 3)
                  //                       : const EdgeInsets.only(left: 20, bottom: 0),
                  //                   alignment: Alignment.centerLeft,
                  child: TextFormField(
                    onFieldSubmitted: widget.onFieldSubmitted,
                    maxLines: widget.maxLines,
                    controller: widget.controller,
                     focusNode: _focusNode,
                    onChanged: widget.onChanged,
                    style: widget.style ?? AppConstants.description.copyWith(color: Colors.black),
                    validator: widget.title.endsWith("*") && widget.validator == null
                        ? (value) {
                            if (value == null || value.isEmpty) {
                              _focusNode.requestFocus();
                              return "Bitte gib einen Wert ein";
                            } else {
                              return null;
                            }
                          }
                        : widget.validator,
                    obscureText: widget.obscureText,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: widget.textInputType,
                    inputFormatters: widget.inputFormatters,
                    readOnly: widget.readOnly,
                    decoration: InputDecoration(
                      filled: widget.backgroundColor != null ? true : false,
                      fillColor: widget.backgroundColor ?? Colors.transparent,
                      contentPadding: const EdgeInsets.all(15),
                      isDense: true,
                      prefixIcon: widget.prefixIcon,
                      suffixIcon: widget.suffixIcon == null
                          ? null
                          : GestureDetector(onTap: widget.onClick, child: widget.suffixIcon),
                      hintText: widget.hintText,
                      hintStyle: widget.hintTextStyle ??
                          AppConstants.description
                              .copyWith(color: Colors.black.withOpacity(0.4)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.borderRadius),
                        borderSide: const BorderSide(
                          width: 1,
                          color: ColorConstants.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.borderRadius),
                        borderSide: BorderSide(
                          width: 1,
                          color: widget.focusBorderColor ?? ColorConstants.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.borderRadius),
                        borderSide: BorderSide(
                          width: 1,
                          color: widget.borderColor ?? ColorConstants.black,
                        ),
                      ),
                    ),
                  ))
            ],
          );
  }
}
