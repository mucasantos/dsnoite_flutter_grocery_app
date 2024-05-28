import 'package:flutter/material.dart';
import 'package:grocery_app/services/app_constants.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.btnTitle = "Entrar",
    required this.onPressed,
  });
  final String btnTitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
            height: 60,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ))),
                onPressed: onPressed,
                child: Text(
                  btnTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          )),
        ],
      ),
    );
  }
}
