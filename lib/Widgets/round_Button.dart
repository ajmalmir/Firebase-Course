import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final bool loading;
  const RoundButton({
    super.key, 
    required this.title, 
    this.onTap, 
    this.loading= false
    });

  @override
  Widget build(BuildContext context) {
    // ! Container ---------------------------------------
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.deepPurple,
        ),
        height: 50,
        child: Center(
          child:loading? CircularProgressIndicator(strokeWidth: 3,color: Colors.white,):
            Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
