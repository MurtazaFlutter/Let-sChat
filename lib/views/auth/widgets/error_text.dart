import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String? errorText;
  const ErrorText({Key? key, this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5.0),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          const SizedBox(
            height: 5.0,
          ),
          Text(
            errorText!,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
