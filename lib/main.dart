import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/users/users.dart';
import 'package:mobile_project/pages/authentication/login_page.dart';
import 'package:mobile_project/pages/cart/cart_page.dart';
import 'package:mobile_project/pages/main/main_page.dart';
import 'package:mobile_project/pages/userprofile/user_profile_edit_page.dart';
import 'package:mobile_project/pages/userprofile/user_profile_page.dart';
import 'package:mobile_project/services/users/users_services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var options = const FirebaseOptions(
    apiKey: "AIzaSyBPrJmorkKMnCtzCLYmU6qt_Q6GaViO4WE",
    projectId: "mobileproject-40d64",
    messagingSenderId: "804352829518",
    appId: "1:804352829518:web:15acdfce08c63ad0687b1f",
    storageBucket: "mobileproject-40d64.appspot.com",
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
        ChangeNotifierProvider(
          create: (_) => UsersServices(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorSchemeSeed: Color.fromARGB(255, 1, 25, 3),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/mainpage': (context) => MainPage(),
          '/userprofile': (context) => const UserProfilePage(),
          '/userprofileedit': (context) => const UserProfileEditPage(),
          '/cartpage': (context) => CartPage()
        },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginPage());
            case '/mainpage':
              return MaterialPageRoute(builder: (_) => MainPage());
            case '/userprofile':
              return MaterialPageRoute(builder: (_) => UserProfilePage());
            case '/userprofileedit':
              return MaterialPageRoute(
                  builder: (_) =>
                      UserProfileEditPage(users: settings.arguments as Users));
            case '/cartpage':
              return MaterialPageRoute(builder: (_) => CartPage());
          }
        },
      ),
    );
  }
}




// // // main.dart
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'dart:io';
// // import 'package:image_picker/image_picker.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return const MaterialApp(
// //       // Hide the debug banner
// //       debugShowCheckedModeBanner: false,
// //       title: 'albertosales.com',
// //       home: HomePage(),
// //     );
// //   }
// // }

// // class HomePage extends StatefulWidget {
// //   const HomePage({Key? key}) : super(key: key);

// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   // This is the file that will be used to store the image
// //   File? _image;
// //   Uint8List webImage = Uint8List(8);
// //   // This is the image picker
// //   final _picker = ImagePicker();
// //   // Implementing the image picker
// //   Future<void> _openImagePicker() async {
// //     if (!kIsWeb) {
// //       final XFile? pickedImage =
// //           await _picker.pickImage(source: ImageSource.gallery);
// //       if (pickedImage != null) {
// //         setState(() {
// //           _image = File(pickedImage.path);
// //         });
// //       }
// //     } else if (kIsWeb) {
// //       XFile? image = await _picker.pickImage(source: ImageSource.gallery);
// //       if (image != null) {
// //         var imageSelected =
// //             await image.readAsBytes(); //converte a imagem para bytes
// //         setState(() {
// //           webImage = imageSelected;
// //           _image = File('a');
// //         });
// //       }
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: const Text('albertosales.com'),
// //         ),
// //         body: SafeArea(
// //           child: Padding(
// //             padding: const EdgeInsets.all(35),
// //             child: Column(children: [
// //               Center(
// //                 // this button is used to open the image picker
// //                 child: ElevatedButton(
// //                   onPressed: _openImagePicker,
// //                   child: const Text('Selecione uma Imagem'),
// //                 ),
// //               ),
// //               const SizedBox(height: 35),
// //               // The picked image will be displayed here
// //               Container(
// //                 alignment: Alignment.center,
// //                 width: double.infinity,
// //                 height: 300,
// //                 color: Colors.grey[300],
// //                 child: ClipOval(
// //                   // borderRadius: BorderRadius.circular(12),
// //                   child: kIsWeb
// //                       ? Image.memory(
// //                           webImage,
// //                           height: 80,
// //                           width: 80,
// //                           fit: BoxFit.cover,
// //                         )
// //                       : Image.file(
// //                           _image!,
// //                           height: 80,
// //                           width: 80,
// //                           fit: BoxFit.cover,
// //                         ),
// //                 ),
// //               )
// //             ]),
// //           ),
// //         ));
// //   }
// // }
