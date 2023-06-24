import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Shimmer extends StatelessWidget {
 final  double opacity;
  
  const Shimmer({super.key, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: const EdgeInsets.all(7),
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Color.fromARGB(180, 113, 110, 110),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Container(
          //color: Colors.pinkAccent,
          padding: const EdgeInsets.fromLTRB(4.5, 8, 11.5, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedOpacity(
                  duration:const Duration(milliseconds:960 ),
                                 curve: Curves.easeInOut,
                           opacity: opacity,
                child: Container(
                 
                  width: 75,height: 75,decoration: const BoxDecoration(shape: BoxShape.circle,color: Color.fromARGB(255, 82, 79, 79), ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(width: double.infinity,
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                        duration:const Duration(milliseconds:960 ),
                                 curve: Curves.easeInOut,
                           opacity: opacity,
                      child: Container(
                        height:12,
                        width:double.infinity,
                        decoration: BoxDecoration(color:  const Color.fromARGB(255, 82, 79, 79),borderRadius:  BorderRadius.circular(7)),
                      
                      ),
                    ),
                    AnimatedOpacity(
                        duration:const Duration(milliseconds:960 ),
                                 curve: Curves.easeInOut,
                           opacity: opacity,
                      child: Container(
                        width: double.infinity,
                        height: 12,
                        decoration: BoxDecoration(color:  const Color.fromARGB(255, 82, 79, 79),borderRadius:  BorderRadius.circular(7)),
                      ),
                    ),
                  ],
                ),
              ),
           ],
          ),
        ),
      ),
    );
  }
}






  // ignore: unused_local_variable
 
  