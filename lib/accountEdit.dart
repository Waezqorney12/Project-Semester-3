// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class editprofile extends StatefulWidget {
//   @override
//   State<editprofile> createState() => _editprofileState();
// }

// class _editprofileState extends State<editprofile> {
//   bool isObscurePassword = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter Edit Profile UI'),
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//             ),
//             onPressed: () {},
//           ),
//           actions: [
//             IconButton(
//                 icon: Icon(
//                   Icons.settings,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {}),
//           ],
//         ),
//         body: Container(
//           padding: EdgeInsets.only(left: 15, top: 20, right: 15),
//           child: GestureDetector(
//             onTap: () {
//               FocusScope.of(context).unfocus();

//             },
//             child: ListView(
//               children: [
//                 Center(
//                   child: Stack(
//                     children: [
//                       Container(

//                         width: 130,
//                         height: 130,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                           width: 4.0,
//                           color: Colors.white),
//                           boxShadow: [
//                             BoxShadow(
//                               spreadRadius: 2,
//                               blurRadius: 10,
//                               color: Colors.black.withOpacity(0.1)

//                             )
//                           ],
//                           shape: BoxShape.circle,
//                           image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: NetworkImage(
//                             'https://cdn.pixabay.com/photo/2022/12/11/10/52/wolf-7648641_960_720.jpg'
//                             )
//                           )
//                           ),
//                         ),
//                       Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                             width: 4.0,
//                             color: Colors.white,
//                             ),
//                             color: Colors.blue
//                           ),
//                           child: Icon(
//                             Icons.edit,
//                             color: Colors.white,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 30,),
//                 buidTextField("Full Name","rafli", false),
//                 buidTextField("Email", "masrafli2017@gmail.com", false),
//                 buidTextField("Password", "******", true),
//                 buidTextField("Location", "Jember", false),
//                 SizedBox(height: 30,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     OutlinedButton(
//                       onPressed: () {},
//                      child: Text("CANCEL"),
//                      style: TextStyle(
//                       fontSize: 15,
//                       letterSpacing: 2,
//                       color: Colors.black

//                     ))
//                   ],
//                 )



//               ],
//             ),
//           ),
//         ));
//   }
//   Widget buidTextField(String labelText, String placeholder,bool isPasswordTextField){
//     return Padding(
//       padding: EdgeInsets.only(bottom: 30),
//       child: TextField(
//         obscureText: isPasswordTextField ? isObscurePassword : false,
//         decoration: InputDecoration(
//           suffixIcon: isPasswordTextField ?
//           IconButton 
//           (icon: Icon(Icons.remove_red_eye, color: Colors.grey),
//           onPressed: () {}
//         ): null,
//         contentPadding: EdgeInsets.only(bottom: 5),
//         labelText: labelText,
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         hintText: placeholder,
//         hintStyle: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//           color: Colors.grey
          
//         )
//         ),
//       ),
//     );
  
    
//   }
// }
