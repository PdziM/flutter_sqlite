import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/mapping_colors.dart';

// ignore: must_be_immutable
class CustomTextArea extends StatelessWidget {
  const CustomTextArea({
    Key? key,
    this.title,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.labelText,
    this.keyboardType,
    this.errorText,
    this.inputFormatters,
    this.prefixIcon,
    this.datePicker,
    this.readOnly,
    this.hintText,
    this.onTap,
    this.mandatory,
    this.focusNode,
    this.suffixIcon,
    this.maxLength,
    this.enabled,
    this.obscureText = false,
    this.textInputAction,
    this.autofocus,
  }) : super(key: key);

  final ValueChanged<String>? onChanged;
  final String? title;
  final TextEditingController controller;
  final ValueChanged<String>? onSubmitted;
  final String? labelText;
  final TextInputType? keyboardType;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final VoidCallback? datePicker;
  final bool? readOnly;
  final String? hintText;
  final VoidCallback? onTap;
  final bool? mandatory;
  final bool? enabled;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final int? maxLength;
  final bool obscureText;
  final bool? autofocus;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            title != null
                ? Text(
                    title!,
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                : Container(),
            const SizedBox(
              width: 8,
            ),
            mandatory == true
                ? const Text(
                    '*',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )
                : Container()
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: TextField(
                autofocus: autofocus ?? false,
                onSubmitted: onSubmitted,
                onChanged: onChanged,
                maxLength: maxLength,
                onTap: onTap,
                readOnly: readOnly ?? false,
                controller: controller,
                keyboardType: TextInputType.multiline,
                textInputAction: textInputAction,
                inputFormatters: inputFormatters ?? [],
                minLines: 6,
                maxLines: 10,
                focusNode: focusNode,
                obscureText: obscureText,
                decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    enabled: enabled ?? true,
                    labelText: labelText,
                    hintText: hintText,
                    errorText: errorText,
                    counterText: '',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 16),
                    prefixIcon: prefixIcon,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: suffixIcon,
                    ),
                    fillColor: Theme.of(context).brightness == Brightness.light
                        ? ColorsConstants.bg200
                        : ColorsConstants.text200,
                    suffixIconConstraints:
                        const BoxConstraints(minHeight: 22, minWidth: 22),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: ColorsConstants.primary200,
                            width: 2,
                            style: BorderStyle.solid)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(style: BorderStyle.none)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(style: BorderStyle.none)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2)),
                    isCollapsed: true),
              ),
            ),
          ],
        )
      ],
    );
  }
}
