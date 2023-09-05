import 'package:flutter/material.dart';
import 'package:mobile_project/services/users/users_services.dart';
import 'package:provider/provider.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var users = Provider.of<UsersServices>(context);
    var users = Provider.of<UsersServices>(context, listen: false).getUser();
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          const Text(
            "Perfil de Usuário",
            style: TextStyle(
              color: Color.fromARGB(255, 2, 32, 3),
              fontSize: 28,
              fontFamily: 'Lustria',
              fontWeight: FontWeight.w700,
            ),
          ),
          Card(
            elevation: 1.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15,
              ),
              child: Consumer<UsersServices>(
                builder: (context, usersServices, child) {
                  return Row(children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/aninha-logo.png',
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('alberto sales'),
                        Text('albertosales@ifmt.edu.br'),
                        Text('(65) - 99609- 9909'),
                      ],
                    )
                  ]);
                },
              ),
            ),
          ),
          const Card(
            elevation: 1.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.person_add_alt_1_outlined,
                    size: 90.0,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cadastro',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Edite dados pessoais, profissionais'),
                        Text('Emails, telefones, redes sociais e outros'),
                      ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}