
import 'package:flutter/material.dart';
import 'package:mobile_project/services/users/users_services.dart';
import 'package:provider/provider.dart';

class EditUserProfilePage extends StatefulWidget {
  @override
  _EditUserProfilePageState createState() => _EditUserProfilePageState();
}

class _EditUserProfilePageState extends State<EditUserProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _birthController = TextEditingController();
  TextEditingController _socialController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Telefone'),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _birthController,
              decoration: InputDecoration(labelText: 'Data de Nascimento'),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _socialController,
              decoration: InputDecoration(labelText: 'Rede Social'),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Nome de Usuário'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
            
              },
              child: Text('Salvar Alterações'),
            ),
            
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: EditUserProfilePage()));
}
