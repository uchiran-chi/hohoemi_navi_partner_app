import 'package:flutter/cupertino.dart';

class SignupContainer extends StatelessWidget{
  SignupContainer({super.key, required this.widgetList, this.text});

  String? text;
  final List<Widget> widgetList;

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: Color(0xFFEECBD4))],
          border: Border.all(color: const Color(0xFFCCCCCC))
      ),
      child: Column(
        children: [
          Text(text!),
          Column(
            children: widgetList,
          )
        ]
      ),
    );
  }
}