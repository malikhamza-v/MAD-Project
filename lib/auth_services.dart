// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:project/login_screen.dart';
// import 'package:project/signup_screen.dart';


// class AuthService{
//   final FirebaseAuth _auth;

//   AuthService(this._auth);

//   Stream<User?> get authStateChanges => _auth.idTokenChanges();

//   Future<String> LoginScreen(String email, String password) async{
//     try{
//       await _auth.signInWithEmailAndPassword(email:email, password:password);
//       return "Login";
//     }catch(e){
//       return e;
//     }
//   }

//   Future<String> SignUpScreen(String email, String password,String name,String number) async{
//     try{
//       await _auth.createUser(email:email, password:password,name:name,number:num);
//       return "SignUpScreen";
//     }catch(e){
//       // return e;
//     }
//   }
//   }




