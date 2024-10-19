import 'package:tmdb_movie_app/common/constants/spacers.dart';
import 'package:tmdb_movie_app/common/extensions/context_extension.dart';
import 'package:tmdb_movie_app/common/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants/dimensions.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.labelName,
    required this.hintName,
    this.onChanged,
    this.validator,
    required this.controller,
    this.obscureText = false,
    this.maxLines,
    this.suffixText,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.textInputType = TextInputType.text,
    this.maxLength,
    this.onTapOutside,
    this.onEditingComplete,
    this.inputFormatters,
  });

  final String? labelName;
  final String hintName;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool obscureText;
  final int? maxLines;
  final String? suffixText;
  final AutovalidateMode autovalidateMode;
  final TextInputType textInputType;
  final int? maxLength;
  final Function(PointerDownEvent)? onTapOutside;
  final void Function()?  onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelName != null
            ? Column(
                children: [
                  Text(
                    widget.labelName!,
                    style: context.apptextTheme.displaySmall,
                  ),
                  FixedSpacers.spacerH10,
                ],
              )
            : const SizedBox.shrink(),
        TextFormField(
          onTapOutside: widget.onTapOutside,
          controller: widget.controller,
          onChanged: widget.onChanged,
          validator: widget.validator,
          autofocus: false,
          inputFormatters: widget.inputFormatters,
          onEditingComplete: widget.onEditingComplete ,
          maxLines: widget.maxLines,
          keyboardType: widget.textInputType,
          autovalidateMode: widget.autovalidateMode,
          style: context.apptextTheme.headlineMedium,
          obscureText: widget.obscureText,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            hintStyle: context.textTheme.displayMedium
                ?.copyWith(fontSize: Sizer.size14),
            hintText: widget.hintName,
            focusedBorder: InputBorder.none,
            errorStyle: context.apptextTheme.displaySmall
                ?.copyWith(color: AppColors.red),
            filled: true,
            suffixText: widget.suffixText,
            fillColor: context.appColorScheme.onSurface,
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}
