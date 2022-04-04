import 'package:bloc_5/bloc/user_bloc.dart';
import 'package:bloc_5/cubit/user_cubit.dart';
import 'package:bloc_5/services/user_repository.dart';
import 'package:bloc_5/widgets/action_buttons.dart';
import 'package:bloc_5/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final usersRepository = UsersRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(usersRepository),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Users List'),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ActionButtons(),
              Expanded(child: UserList()),
            ],
          )),
    );
  }
}
