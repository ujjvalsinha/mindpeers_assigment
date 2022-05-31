import 'package:flutter/material.dart';
import 'package:mindpeers_assigment/core/app_configs/colors.dart';

class MindPeersTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final String? initialvalues;
  final String hintText;
  final bool obsecureText;

  const MindPeersTextField(
      {Key? key,
      this.onChanged,
      required this.hintText,
      this.initialvalues,
      this.obsecureText = false})
      : super(key: key);

  @override
  State<MindPeersTextField> createState() => _MindPeersTextFieldState();
}

class _MindPeersTextFieldState extends State<MindPeersTextField> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: AppColors.searchBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(.5)),
      ),
      child: TextFormField(
        onChanged: widget.onChanged,
        // initialValue: widget.initialvalues,
        //enabled: false, // to trigger disabledBorder
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            size: 26,
            color: Colors.white.withOpacity(.6),
          ),
          fillColor: AppColors.searchBackgroundColor,
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle:
              TextStyle(fontSize: 14, color: Colors.white.withOpacity(.6)),
        ),

        obscureText: widget.obsecureText,
      ),
    );
  }
}
