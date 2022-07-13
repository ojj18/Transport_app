
import 'package:flutter/material.dart';

class TsContainer extends StatelessWidget {

  const TsContainer({ this.onPressed,
    Key? key,
   
  }) : super(key: key);

  final VoidCallback? onPressed;
  
  @override
  Widget build(BuildContext context) {
    return 
    
  Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              child: Flex(direction: Axis.vertical,
                
                children: [
                  Flex(direction: Axis.horizontal,mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text("G-Box(S)"),
                 Container(color: const Color.fromRGBO(63, 81, 181, 1), 
                  child:const Text("70"),),],),
                 

                const  Divider(
    
    color: Colors.black26, 
    height: 20, 
    thickness: 1, 
)
  ],),
              onTap:onPressed,
          ),
        );
         
    
    
  }
}
