import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0; //variavel utilizada para controlar o indice do navigationBar
  final List<Widget> _pages = [
    Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: Text("Home"),
    ),
     Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("Pedidos"),
    ),
     Container(
      color: Colors.green,
      alignment: Alignment.center,
      child: Text("Perfil de usuarios"),
    ),
     Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: Text("Configurações"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.list),
        //   onPressed: () {
        //     showDialog(
        //       context: context, 
        //       builder: (BuildContext context){
        //         return const AlertDialog(
        //           title: Text("uso do alerta"),
        //           content: Text("teste para disparo"),
        //         );
        //       },
        //       );
        //   },
        // ),
        title: Text("IFMT- E-COMMERCE"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search),),
          IconButton(onPressed: () {}, icon: Icon(Icons.filter),),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert),),
        ],
      ),
      body: IndexedStack(
        index: _index,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",

          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Pedidos",
            ),
              BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil de usuario",
              ),  
               BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Configurações",
              ),  
        ],
        onTap: changeTab, 
        selectedItemColor: const  Color(0xFF0C356A),
        unselectedItemColor:  Color.fromARGB(255, 172, 188, 209) ,
        
      ),
      drawer: const Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Text("pastelaria do zezinho"),
            ),
            ListTile(
              title: Text("Home"),
            ),
              ListTile(
              title: Text("Pedidos"),
            ),
              ListTile(
              title: Text("Perfil do usuário"),
            ),
            Divider(
              height: 2,
            ),
            ListTile(
              title: Text(("Configurações do sistema")),

            )
          ],
        ),
      ),
    );
  }
  void changeTab(int pos){
    setState(() {
      _index = pos;
    });
  }
}
