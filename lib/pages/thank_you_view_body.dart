import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: Padding(
         padding: const EdgeInsets.all(20),
         child: Stack(
           clipBehavior: Clip.none,
           children: [
             Container(
               width: double.infinity,
               decoration: ShapeDecoration(
                 color: const Color(0xFFD9D9D9),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20),
                 ),
               ),
               child:  const Padding(
                 padding: EdgeInsets.only(top: 50+16,),
                 child: Column(
                   children: [
                     Text(
                       'Thank You!',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 25,
                         fontWeight: FontWeight.w500,
                         height: 0,
                       ),
                     ),
                     Text(
                       'Your Transaction Was Successful',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 20,
                         fontWeight: FontWeight.w400,
                         height: 0,
                       ),
                     ),
                   ],
                 ),
               ),
             ),
             Positioned(
               bottom: MediaQuery.sizeOf(context).height*.2+20,
               left: 32,
               right: 32,
               child: Row(
                 children: List.generate(30, (index) =>
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 2) ,
                         child: Container(
                           color: Color(0xFFB8B8B8),
                           height: 2,
                         ),
                       ),
                     )),
               ),
             ),
             Positioned(
               bottom: MediaQuery.sizeOf(context).height*.2,
               left: -20,
                 child:const CircleAvatar(
                   backgroundColor: Colors.white,
                 ),),
             Positioned(
               bottom: MediaQuery.sizeOf(context).height*.2,
               right: -20,
                 child:const CircleAvatar(
                   backgroundColor: Colors.white,
                 ),),
             const Positioned(
               left: 0,
               right: 0,
               top: -50,
               child: CircleAvatar(
                 radius: 50,
                 backgroundColor: Color(0xFFD9D9D9),
                 child: CircleAvatar(
                   radius: 40,
                   backgroundColor: Color(0xFF34A853),
                   child: Icon(Icons.check,color: Colors.white,size: 50,),
                 ),
               ),
             )
           ],
         ),
       ),
    );
  }
}
class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Date',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        Text(
          '17/4/2024',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ],
    );
  }
}
