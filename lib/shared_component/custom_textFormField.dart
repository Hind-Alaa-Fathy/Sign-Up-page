import 'package:flutter/material.dart';
import 'package:form/shared_component/text_in_app.dart';

class DefaultTextFormField extends StatelessWidget {
   DefaultTextFormField({
    super.key,
    required this.controller,
    required this.validatorText,
     required this.label,
     this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next ,
    this.obscureText = false,
  });
   final TextEditingController controller;
   final String validatorText;
   final String label;
    bool obscureText ;
    TextInputType keyboardType;
   TextInputAction textInputAction  ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if(value!.isEmpty)
            {
              return '$validatorText must not be empty';
            }
        },
        style: const TextStyle(
          fontSize: 20,
        ),
        cursorColor: Colors.orangeAccent,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscureText,
        decoration: InputDecoration(
          label: textInApp(text: label,color: Colors.blueGrey.shade700),
          focusedBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.orangeAccent.shade700))
        ),
        maxLines: obscureText? 1 :null,
        maxLength: obscureText? 10 : null,

      ),
    );
  }
}
