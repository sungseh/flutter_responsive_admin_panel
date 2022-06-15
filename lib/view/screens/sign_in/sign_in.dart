import 'package:flutter/material.dart';



class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


// class SignIn extends StatefulWidget {
//   const SignIn({Key? key}) : super(key: key);

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {  
//   var passwordCtrl = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//   String? password;


//   handleSignIn () async{
//     final AdminBloc ab = Provider.of<AdminBloc>(context, listen: false);
//     if(formKey.currentState!.validate()){
//       formKey.currentState!.validate();
//       if(password == "Config().testerPassword"){
//         await ab.setSignInForTesting()
//         .then((value) => nextScreenReplace(context, PageControllerWidget()));
//       } else {
//         await ab.setSignIn()
//         .then((value) => nextScreenReplace(context, PageControllerWidget()));
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final AdminBloc ab = Provider.of<AdminBloc>(context, listen: false);
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: Center(
//         child: Container(
//           height: 400,
//           width: 600,
//           padding: const EdgeInsets.all(30),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(0),
//             boxShadow: <BoxShadow>[
//               BoxShadow(
//                 color: Colors.grey[300]!, 
//                 blurRadius: 10, 
//                 offset: const Offset(3, 3)
//               )
//             ],
//           ),
//           child: Column(
//             children: <Widget>[
//               const SizedBox(height: 50,),
//               Text("Config().appName", style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),
//               const Text('Welcome to Admin Panel', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
//               const SizedBox(height: 50,),
//               Padding(
//                 padding: const EdgeInsets.only(left: 40, right: 40),
//                 child: Form(
//                   key: formKey,
//                   child: TextFormField(
//                   controller: passwordCtrl,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                   hintText: 'Enter Password',
//                   border: const OutlineInputBorder(),
//                   labelText: 'Password',
//                   contentPadding: const EdgeInsets.only(right: 0, left: 10),
//                   suffixIcon: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: CircleAvatar(
//                       radius: 15,
//                       backgroundColor: Colors.grey[300],
//                       child: IconButton(icon: const Icon(Icons.close, size: 15), onPressed: (){
//                         passwordCtrl.clear();
//                       }),
//                     ),
//                   )
                  
//                 ),
//                 validator: (String? value){
//                   String? _adminPassword = ab.adminPass;
//                   if(value!.length == 0) return "Password can't be empty";
//                   else if(value != _adminPassword && value != "Config().testerPassword") return 'Wrong Password! Please try again.';
                  
//                   return null;
//                 },
//                 onChanged: (String value){
//                   setState(() {
//                     password = value;
//                   });
//                 },
//                 )),
//               ),
//               const SizedBox(height: 30,),
//               Container(
//             height: 45,
//             width: 200,
//             decoration: BoxDecoration(
//             color: Colors.deepPurpleAccent,
//             borderRadius: BorderRadius.circular(30),
//             boxShadow: <BoxShadow>[
//               BoxShadow(
//                 color: Colors.grey[400]!,
//                 blurRadius: 10,
//                 offset: const Offset(2, 2)
//               )
//             ]

//             ),
//             child: TextButton.icon(
//               style: ButtonStyle(
//                 shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30)
//                 ))
//               ),
//               icon: Icon(LineIcons.arrowRight, color: Colors.white, size: 25,),
//               label: const Text('Sign In', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16),),
//               onPressed: () => handleSignIn(), 
//               ),
//           ),
//             ],
//           ),
//         ),
//       )
//     );
//   }
// }