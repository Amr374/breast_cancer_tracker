import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   final Function onClick;
   final String hint;
   final String input;
  CustomTextField(
      {@required this.onClick,@required this.hint, this.input});
   var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,top: 10,right: 5),
      child: TextFormField(
        // controller: controller,
      cursorColor: Colors.black,
    keyboardType: input=='String' ? TextInputType.name :TextInputType.number ,
    validator: (val) => val.isEmpty ? 'Required' : null,
    onSaved: onClick,
        decoration: InputDecoration(
          filled: true,
          hintText: hint,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.black)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.black)),
        ),

    ),
    );
  }
}
