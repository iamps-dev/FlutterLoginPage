import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWgt extends StatefulWidget {
  const TextFormFieldWgt({
    super.key,
    required this.hinttext,
    required this.controller,
    this.label,
    this.prxicon,
    this.prefixIconWidget,
    this.sfxicon,
    this.sfxcolor,
    this.obstxt = false,
    this.validator,
    this.onSficonTap,
    this.maxlen = 100,
    this.onChanged,
    this.inptype = TextInputType.text,
    this.inputFormatters,
    this.focusNode,
    this.onfieldsubmit,
    this.minline,
    this.maxline,
    this.ontap,
    this.isDropdown = false,
    this.dropdownItems,
    this.enabled = true,
    this.autofocus = false,
  });

  final String hinttext;
  final String? label;
  final IconData? prxicon;
  final Widget? prefixIconWidget;
  final IconData? sfxicon;
  final Color? sfxcolor;
  final TextEditingController controller;
  final bool obstxt;
  final int? maxlen;
  final void Function()? onSficonTap;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? inptype;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final void Function(String)? onfieldsubmit;
  final void Function()? ontap;
  final int? minline;
  final int? maxline;
  final bool isDropdown;
  final List<String>? dropdownItems;
  final bool enabled;
  final bool autofocus;

  @override
  State<TextFormFieldWgt> createState() => _TextFormFieldWgtState();
}

class _TextFormFieldWgtState extends State<TextFormFieldWgt> {
  late FocusNode _focusNode;
  bool isHovering = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    if (widget.autofocus) {
      _focusNode.requestFocus();
    }
    _focusNode.addListener(() {
      setState(() {}); // rebuild on focus change
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose(); // dispose only if created here
    }
    super.dispose();
  }

  Color getBorderColor() {
    if (_focusNode.hasFocus) return Colors.indigo.shade700;
    if (isHovering) return Colors.indigo.shade400;
    return Colors.grey.shade400;
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = getBorderColor();

    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        enabled: widget.enabled,
        autofocus: widget.autofocus,
        textCapitalization: TextCapitalization.words,
        obscureText: widget.obstxt,
        maxLength: widget.maxlen,
        keyboardType: widget.inptype,
        inputFormatters: widget.inputFormatters,
        maxLines: widget.maxline,
        minLines: widget.minline,
        onTap: widget.ontap,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onfieldsubmit,
        validator: widget.validator,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontSize: 15.0,
        ),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          prefixIcon: widget.prefixIconWidget ??
              (widget.prxicon == null ? null : Icon(widget.prxicon)),
          suffixIcon: widget.sfxicon == null
              ? null
              : IconButton(
            icon: Icon(widget.sfxicon),
            onPressed: widget.onSficonTap,
            color: widget.sfxcolor,
          ),
          contentPadding: const EdgeInsets.all(10),
          hintText: widget.hinttext,
          labelText: widget.label ?? widget.hinttext,
          counterText: '',
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(0.5),
            fontSize: 15.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: borderColor, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: borderColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: borderColor, width: 2),
          ),
        ),
      ),
    );
  }
}