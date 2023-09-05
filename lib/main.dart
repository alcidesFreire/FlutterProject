import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/pages/home/home_page.dart';
import 'package:mobile_project/pages/main/main_page.dart';

import 'package:mobile_project/pages/authentication/login_page.dart';

import 'package:mobile_project/services/cart/cart_service.dart';
import 'services/users/users_services.dart';
// import 'package:flutter_ecom/services/users/users_services.dart';

import 'package:provider/provider.dart';
import '';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var options = const FirebaseOptions(
    apiKey: "AIzaSyBPrJmorkKMnCtzCLYmU6qt_Q6GaViO4WE",
    projectId: "mobileproject-40d64",
    messagingSenderId: "804352829518",
    appId: "1:804352829518:web:15acdfce08c63ad0687b1f",
  );
  if (kIsWeb) {
    await Firebase.initializeApp(options: options);
  } else {
    await Firebase.initializeApp();
  }
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UsersServices>(
          create: (context) => UsersServices(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorSchemeSeed: const Color(0xFF012B05),
          
        ),
        initialRoute: '/',
        routes: {
          '/':(context) => LoginPage(),
          '/home':(context) => HomePage(),
          '/mainpage':(context) => MainPage(),
        },
        // home: LoginPage(),
      ),
    );
  }
}









// // main.dart
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // Hide the debug banner
//       debugShowCheckedModeBanner: false,
//       title: 'albertosales.com',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // This is the file that will be used to store the image
//   File? _image;
//   Uint8List webImage = Uint8List(8);
//   // This is the image picker
//   final _picker = ImagePicker();
//   // Implementing the image picker
//   Future<void> _openImagePicker() async {
//     if (!kIsWeb) {
//       final XFile? pickedImage =
//           await _picker.pickImage(source: ImageSource.gallery);
//       if (pickedImage != null) {
//         setState(() {
//           _image = File(pickedImage.path);
//         });
//       }
//     } else if (kIsWeb) {
//       XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//       if (image != null) {
//         var imageSelected =
//             await image.readAsBytes(); //converte a imagem para bytes
//         setState(() {
//           webImage = imageSelected;
//           _image = File('a');
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('albertosales.com'),
//         ),
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(35),
//             child: Column(children: [
//               Center(
//                 // this button is used to open the image picker
//                 child: ElevatedButton(
//                   onPressed: _openImagePicker,
//                   child: const Text('Selecione uma Imagem'),
//                 ),
//               ),
//               const SizedBox(height: 35),
//               // The picked image will be displayed here
//               Container(
//                 alignment: Alignment.center,
//                 width: double.infinity,
//                 height: 300,
//                 color: Colors.grey[300],
//                 child: ClipOval(
//                   // borderRadius: BorderRadius.circular(12),
//                   child: kIsWeb
//                       ? Image.memory(
//                           webImage,
//                           height: 80,
//                           width: 80,
//                           fit: BoxFit.cover,
//                         )
//                       : Image.file(
//                           _image!,
//                           height: 80,
//                           width: 80,
//                           fit: BoxFit.cover,
//                         ),
//                 ),
//               )
//             ]),
//           ),
//         ));
//   }
// }
