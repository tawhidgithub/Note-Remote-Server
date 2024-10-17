import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Colors/colors.dart';


class ButtoN extends StatelessWidget {
  const ButtoN({super.key,required this.title,required this.onClick ,this.loding=false,this.wight=double.infinity});
  final String title;
  final VoidCallback onClick;
  final bool loding;
  final double wight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 55,
        width: wight,
        decoration: BoxDecoration(
          color: AppColors.primaryColorOrange,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child:loding ? const CircularProgressIndicator():Text(title,style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),),
        ),
      ),
    );
  }
}


