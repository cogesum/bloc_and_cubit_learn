import 'package:bloc_5/bloc/user_bloc.dart';
import 'package:bloc_5/bloc/user_event.dart';
import 'package:bloc_5/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = context.read<UserBloc>();
    // final UserCubit userCubit = context.read<UserCubit>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            _userBloc.add(UserLoadEvent());
          },
          child: Text("Load"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green)),
        ),
        SizedBox(
          width: 8,
        ),
        ElevatedButton(
          onPressed: () {
            _userBloc.add(UserDeleteEvent());
          },
          child: Text("Delete"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ),
      ],
    );
  }
}
