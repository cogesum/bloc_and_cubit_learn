import 'package:bloc_5/bloc/user_bloc.dart';
import 'package:bloc_5/bloc/user_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState state) {
        if (state is UserEmptyState) {
          return Center(child: Text("No data received. Press button Load"));
        }
        if (state is UserLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
              child: ListTile(
                  leading: Text(
                    "ID: ${state.loadedUser[index].id}",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  title: Column(
                    children: [
                      Text("${state.loadedUser[index].name}",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Email: ${state.loadedUser[index].email}",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          Text(
                            "Phone: ${state.loadedUser[index].phone}",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          );
        }
        if (state is UserErrorState) {
          return Center(
            child: Text("Error"),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
